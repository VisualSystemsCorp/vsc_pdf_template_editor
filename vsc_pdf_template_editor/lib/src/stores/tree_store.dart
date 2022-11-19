import 'dart:convert';
import 'dart:typed_data';

import 'package:code_text_field/code_text_field.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:highlight/languages/json.dart';
import 'package:mobx/mobx.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_memory_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_raw_image.dart';

import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;

part 'tree_store.g.dart';

class TreeStore = TreeStoreModel with _$TreeStore;

abstract class TreeStoreModel with Store {
  TreeStoreModel(
    this._template,
    this._data,
  ) {
    _sortDialogItems();
    _initControllers();
    _buildPdf();
  }

  late final CodeController _templateController;
  late final CodeController _dataController;

  transformer.AsyncDocument _doc = transformer.AsyncDocument();

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

  @action
  Future<void> onInputChanged() async {
    final newText = _templateController.rawText;
    if (newText == _lastTemplateText) return;
    _lastTemplateText = newText;
    try {
      _template = jsonDecode(newText);
      await _buildPdf();
      buildErrorText = '';
    } catch (e, s) {
      buildErrorText = '$e \n $s';
      debugPrint('$e\n$s');
    }
  }

  @action
  Future<void> onDataChanged() async {
    final newText = _dataController.rawText;
    if (newText == _lastDataText) return;
    _lastDataText = newText;
    try {
      _data = jsonDecode(_dataController.rawText);
      await _buildPdf();
      buildErrorText = '';
    } catch (e, s) {
      buildErrorText = '$e \n $s';
      debugPrint('$e\n$s');
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
      await _buildPdf();
      buildErrorText = '';
    } catch (e, s) {
      buildErrorText = '$e \n $s';
      debugPrint('$e\n$s');
    }
  }

  String _prettyPrint(dynamic object) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString
        .split('\n')
        .forEach((dynamic element) => sb.write('\n$element'));
    return sb.toString();
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

  Future<void> _buildPdf() async {
    _doc = await transformer.Transformer.buildPdf(_template, _data);
    _pdfBytes = await _doc.save();
  }

  void _sortDialogItems() {
    _supportedWidgets = AppConstants.supportedWidgetsMap.keys.toList()..sort();
    _supportedProperties = AppConstants.supportedPropertiesMap.keys.toList()
      ..sort();
  }

  void _initControllers() {
    _templateController = CodeController(
      language: json,
      theme: atomOneDarkReasonableTheme,
      text: _prettyPrint(_template),
      onChange: (val) => EasyDebounce.debounce(
          '', const Duration(milliseconds: 500), () => onInputChanged()),
      webSpaceFix: false,
    );
    _dataController = CodeController(
      language: json,
      theme: atomOneDarkReasonableTheme,
      text: _prettyPrint(_data),
      onChange: (val) => EasyDebounce.debounce(
          '', const Duration(milliseconds: 500), () => onDataChanged()),
      webSpaceFix: false,
    );
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
}
