import 'dart:convert';
import 'dart:typed_data';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:basic_utils/basic_utils.dart';

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {
  _TreeStore(
    this._template,
    this._data,
  ) {
    _mergeTemplate();
    _initTemplateController();
    _initDataController();
    _buildPdf();
  }

  final _supportedWidgets = [
    'Text',
    'Sized Box',
    'Container',
    'Column',
    'Row',
  ];
  final _templateController = TextEditingController();
  final _dataController = TextEditingController();
  final Map<String, dynamic> _rootTemplate = {
    'className': 'TplDocument',
    'pageMode': 'none',
    'children': [
      {'className': 'TplPage', 'pageFormat': 'letter', 'children': []}
    ]
  };

  pw.Document _doc = pw.Document();

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

  Uint8List? get pdfBytes => _pdfBytes;

  List<String> get supportedWidgets => _supportedWidgets;

  TextEditingController get templateController => _templateController;

  TextEditingController get dataController => _dataController;

  set setPdfBytes(Uint8List? value) {
    _pdfBytes = value;
  }

  @action
  onInputChanged() {
    try {
      _template = jsonDecode(_templateController.text);
      _buildPdf();
      buildErrorText = '';
    } catch (e) {
      buildErrorText = e.toString();
    }
  }

  @action
  onDataChanged() {
    _data = jsonDecode(_dataController.text);
    _buildPdf();
  }

  @action
  onWidgetSelected(int index) {
    Map<String, dynamic> map = {};
    switch (index) {
      case 0:
        map = TplText().toJson();
        break;
      case 1:
        map = TplSizedBox().toJson();
        break;
      case 2:
        map = TplContainer().toJson();
        break;
      case 3:
        map = TplColumn().toJson();
        break;
      case 4:
        map = TplRow().toJson();
        break;
    }
    addWidget(map);
  }

  @action
  addWidget(Map<String, dynamic> map) {
    try {
      final cursorPos = _templateController.selection.base.offset;
      final newMap = StringUtils.addCharAtPosition(_templateController.text,
          _reformatNewWidget(jsonEncode(map)), cursorPos);

      _templateController.text = newMap;
      _template = jsonDecode(newMap);
      _buildPdf();
      buildErrorText = '';
    } catch (e) {
      buildErrorText = e.toString();
    }
  }

  @action
  reformat(TextEditingController controller) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(controller.text);
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString
        .split('\n')
        .forEach((dynamic element) => sb.write('\n$element'));
    controller.text = sb.toString();
  }

  @action
  String _reformatNewWidget(String text) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(text);
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString
        .split('\n')
        .forEach((dynamic element) => sb.write('\n$element'));
    text = sb.toString();
    return text;
  }

  _initTemplateController() {
    _templateController.text = jsonEncode(_template);
  }

  _initDataController() {
    _dataController.text = jsonEncode(_data);
  }

  _savePdf() async {
    setPdfBytes = await _doc.save();
  }

  _buildPdf() async {
    try {
      _doc = transformer.Transformer.buildPdf(
          _template['children'][0]['children'][0], _data);
      await _savePdf();
      buildErrorText = '';
    } catch (e) {
      buildErrorText = e.toString();
    }
  }

  _mergeTemplate() {
    final newMap = StringUtils.addCharAtPosition(
        jsonEncode(_rootTemplate), jsonEncode(_template), 114);
    _template = jsonDecode(newMap);
  }
}
