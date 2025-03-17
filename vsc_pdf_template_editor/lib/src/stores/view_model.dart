import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/json.dart';
import 'package:mobx/mobx.dart';
import 'package:queue/queue.dart' as q;
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_editor/src/utils/debouncer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_memory_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_raw_image.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart';

part 'view_model.g.dart';

class ViewModel = BaseViewModel with _$ViewModel;

abstract class BaseViewModel with Store {
  BaseViewModel(
    this._template,
    this._data,
    this.onTemplateChanged,
    this.onDataChanged,
    this.onErrorStateChanged,
  ) {
    _buildPdfDebouncer = Debouncer(() => _buildPdf());
    _sortDialogItems();
    _initControllers();
    _buildPdfDebounced();
  }

  final void Function(Map<String, dynamic> template)? onTemplateChanged;
  final void Function(Map<String, dynamic> data)? onDataChanged;
  final void Function(bool hasError)? onErrorStateChanged;

  late final CodeController _templateController;
  late final CodeController _dataController;
  final _buildCache = TplMemoryCache();

  @observable
  String buildErrorText = '';

  @observable
  int activeTab = 0;

  @readonly
  Map<String, dynamic> _template;

  @readonly
  Map<String, dynamic> _data;

  @readonly
  Uint8List? _pdfBytes = Uint8List(0);

  @readonly
  List<String> _supportedWidgets = [];

  @readonly
  List<String> _supportedProperties = [];

  Uint8List? get pdfBytes => _pdfBytes;

  CodeController get templateController => _templateController;

  CodeController get dataController => _dataController;

  String? _lastTemplateText;
  String? _lastDataText;
  final _buildQueue = q.Queue();
  late final Debouncer _buildPdfDebouncer;

  void dispose() {
    _templateController.dispose();
    _dataController.dispose();
  }

  @action
  Future<void> _onTemplateChanged() async {
    final newText = _templateController.code.text;
    if (newText == _lastTemplateText) return;
    _lastTemplateText = newText;
    try {
      _template = jsonDecode(newText);
      _buildPdfDebounced();
      _setBuildErrorText('');
      onTemplateChanged?.call(_template);
    } catch (e, s) {
      _setBuildErrorText(e, s);
    }
  }

  @action
  Future<void> _onDataChanged() async {
    final newText = _dataController.code.text;
    if (newText == _lastDataText) return;
    _lastDataText = newText;
    try {
      _data = jsonDecode(newText);
      _buildPdfDebounced();
      _setBuildErrorText('');
      onDataChanged?.call(_data);
    } catch (e, s) {
      _setBuildErrorText(e, s);
    }
  }

  @action
  Future<void> addObject(Map<String, dynamic> map) async {
    try {
      final cursorPos = _templateController.selection.base.offset;
      final newTemplate = _templateController.text.substring(0, cursorPos) +
          _reformatNewWidget(jsonEncode(map)) +
          _templateController.text.substring(cursorPos);
      // Setting text on the controller will attempt to rebuild _template, which may
      // result in a parsing error that is displayed.
      _templateController.text = newTemplate;
      _buildPdfDebounced();
      _setBuildErrorText('');
    } catch (e, s) {
      _setBuildErrorText(e, s);
    }
  }

  @action
  void _setBuildErrorText(Object e, [StackTrace? st]) {
    final text = kDebugMode ? '$e${st == null ? '' : '\n$st'}' : e.toString();
    final prevInError = buildErrorText.isNotEmpty;
    buildErrorText = text;
    final isInErrorState = buildErrorText.isNotEmpty;
    if (prevInError != isInErrorState) {
      onErrorStateChanged?.call(isInErrorState);
    }
    if (kDebugMode && isInErrorState) {
      debugPrint(text);
    }
  }

  String _prettyPrint(dynamic object) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(object);
  }
  
  // Public method to get pretty printed JSON from a string
  String getPrettyPrintedJson(String jsonText) {
    try {
      return _prettyPrint(jsonDecode(jsonText));
    } catch (e) {
      print('Error formatting JSON: $e');
      return jsonText; // Return original if formatting fails
    }
  }
  
  // Get the template as a JSON string
  String getTemplateJson() {
    return jsonEncode(_template);
  }
  
  // Direct method to update the template controller text
  void setTemplateControllerTextDirectly(String text) {
    print('⚡ DIRECT TEXT UPDATE TO CONTROLLER');
    _templateController.text = text;
    _lastTemplateText = text; // Prevent rebinding
    
    // Force an update of the template object
    try {
      _template = jsonDecode(text);
      onTemplateChanged?.call(_template);
    } catch (e) {
      print('Error parsing JSON from direct text update: $e');
    }
  }

  @action
  reformat(CodeController controller) {
    controller.text =
        _prettyPrint(const JsonDecoder().convert(controller.text));
  }

  @action
  String _reformatNewWidget(String text) {
    return _prettyPrint(const JsonDecoder().convert(text));
  }

  onWidgetSelected(String name) {
    final map = AppConstants.supportedWidgetsMap[name];
    if (map == null) {
      throw Exception('Unknown widget name: $name');
    }

    addObject(map);
  }

  onPropertySelected(String name) {
    final map = AppConstants.supportedPropertiesMap[name];
    if (map == null) {
      throw Exception('Unknown property name: $name');
    }

    addObject(map);
  }

  void _buildPdfDebounced() {
    _buildPdfDebouncer.trigger(const Duration(milliseconds: 500));
  }
  
  // Public method to force an immediate build without debouncing
  void forceTemplateBuild() {
    print('⚡ ViewModel: Forcing immediate template build');
    _buildPdf();
  }

  Future<void> _buildPdf() async {
    // Ensure that the build is completed in the order it was requested.
    print('🔄 ViewModel: Queueing build job');
    await _buildQueue.add(_buildPdfWorker);
  }

  Future<void> _buildPdfWorker() async {
    try {
      print('🔄 Building PDF with template: ${_template.keys}');
      
      // Ensure we have the latest template data
      try {
        final currentText = _templateController.text;
        final currentTemplate = jsonDecode(currentText);
        if (currentTemplate != _template) {
          print('📝 Template mismatch detected, using controller text');
          _template = currentTemplate;
        }
      } catch (e) {
        print('⚠️ Error parsing template from controller: $e');
      }
      
      _pdfBytes = await transformer.Transformer.buildPdf(
        _template,
        _data,
        buildCache: _buildCache,
      );
      _setBuildErrorText('');
      print('✅ PDF built successfully');
    } catch (e, st) {
      print('❌ Error building PDF: $e');
      _setBuildErrorText(e, st);
    }
  }

  void _sortDialogItems() {
    _supportedWidgets = AppConstants.supportedWidgetsMap.keys.toList()..sort();
    _supportedProperties = AppConstants.supportedPropertiesMap.keys.toList()
      ..sort();
  }

  void _initControllers() {
    _templateController = CodeController(
      language: json,
      text: _prettyPrint(_template),
    )..popupController.enabled = false;
    _templateController.addListener(_onTemplateChanged);

    _dataController = CodeController(
      language: json,
      text: _prettyPrint(_data),
    )..popupController.enabled = false;
    _dataController.addListener(_onDataChanged);

    // Fire them the first time
    _onTemplateChanged();
    _onDataChanged();
  }

  dynamic insertImage(Uint8List file, String name) {
    Map<String, dynamic> map = {};
    final base64Str = base64Encode(file.toList());
    switch (name) {
      case 'Memory Image':
        map = TplMemoryImage("'$base64Str'").toJson();
        break;
      case 'Raw Image':
        map = TplRawImage("'$base64Str'").toJson();
        break;
    }
    addObject(map);
  }
  
  @action
  void updateTemplateFromDesigner(Map<String, dynamic> documentStructure) {
    try {
      print("Updating template from designer...");
      
      // Clean up design-specific properties that shouldn't be part of the final PDF
      final cleanedStructure = _cleanupDesignProperties(documentStructure);
      
      // Update the template with the cleaned structure
      _template = cleanedStructure;
      
      // Update the template controller text with the pretty printed version
      final prettyText = _prettyPrint(_template);
      
      // Only update if it has actually changed to avoid cursor issues
      if (_templateController.text != prettyText) {
        // Store current selection
        final selection = _templateController.selection;
        
        // Update the text
        _templateController.text = prettyText;
        
        // Try to restore cursor position if possible
        if (selection.baseOffset < prettyText.length) {
          _templateController.selection = selection;
        }
      }
      
      // Set last template text to prevent rebinding
      _lastTemplateText = prettyText;
      
      // Rebuild the PDF
      _buildPdfDebounced();
      
      // Notify listeners
      onTemplateChanged?.call(_template);
      
      print("Template update complete");
    } catch (e, s) {
      print("Error updating template: $e");
      _setBuildErrorText(e, s);
    }
  }
  
  // Recursively remove design-specific properties from the template
  Map<String, dynamic> _cleanupDesignProperties(Map<String, dynamic> structure) {
    final Map<String, dynamic> result = {};
    
    // Copy all properties except design-specific ones
    structure.forEach((key, value) {
      if (key != 'designPosition' && key != 'designSize' && key != 'supportedWidgets') {
        if (value is Map<String, dynamic>) {
          // Recursively clean nested maps
          result[key] = _cleanupDesignProperties(value);
        } else if (value is List) {
          // Handle lists (especially children arrays)
          result[key] = _cleanupDesignPropertiesInList(value);
        } else {
          // Copy primitive values as is
          result[key] = value;
        }
      }
    });
    
    return result;
  }
  
  List _cleanupDesignPropertiesInList(List list) {
    final List result = [];
    
    for (var item in list) {
      if (item is Map<String, dynamic>) {
        // Clean each map in the list
        result.add(_cleanupDesignProperties(item));
      } else if (item is List) {
        // Handle nested lists
        result.add(_cleanupDesignPropertiesInList(item));
      } else {
        // Copy primitive values as is
        result.add(item);
      }
    }
    
    return result;
  }
}
