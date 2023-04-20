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

  Future<void> _buildPdf() async {
    // Ensure that the build is completed in the order it was requested.
    await _buildQueue.add(_buildPdfWorker);
  }

  Future<void> _buildPdfWorker() async {
    try {
      _pdfBytes = await transformer.Transformer.buildPdf(
        _template,
        _data,
        buildCache: _buildCache,
      );
      _setBuildErrorText('');
    } catch (e, st) {
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
}
