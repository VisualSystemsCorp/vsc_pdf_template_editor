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
    _initTemplateController();
    _buildPdf();
  }

  final _supportedWidgets = [
    'Text',
    'Sized Box',
    'Container',
    'Column',
    'Row',
  ];
  final Map<String, dynamic> _data;
  final _templateController = TextEditingController();

  pw.Document _doc = pw.Document();

  @readonly
  Map<String, dynamic> _template;

  @readonly
  Uint8List? _pdfBytes = Uint8List(0);

  Uint8List? get pdfBytes => _pdfBytes;

  List<String> get supportedWidgets => _supportedWidgets;

  TextEditingController get templateController => _templateController;

  set setPdfBytes(Uint8List? value) {
    _pdfBytes = value;
  }

  @action
  onInputChanged() {
    _template = jsonDecode(_templateController.text);
    _buildPdf();
  }

  @action
  onWidgetSelected(int index) {
    Map<String, dynamic> map = {};
    switch (index) {
      case 0:
        map = TplText(text: '').toJson();
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
    final cursorPos = _templateController.selection.base.offset;
    final newMap = StringUtils.addCharAtPosition(
        _templateController.text, jsonEncode(map), cursorPos);
    _template = jsonDecode(newMap);
    _initTemplateController();
    _buildPdf();
  }

  @action
  reformat() {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(_templateController.text);
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString.split('\n').forEach((dynamic element) => sb.write('\n$element'));
    _templateController.text = sb.toString();
  }

  _initTemplateController() {
    _templateController.text = jsonEncode(_template);
  }

  _savePdf() async {
    setPdfBytes = await _doc.save();
  }

  _buildPdf() async {
    _doc = transformer.Transformer.buildPdf(_template, _data);
    await _savePdf();
  }
}
