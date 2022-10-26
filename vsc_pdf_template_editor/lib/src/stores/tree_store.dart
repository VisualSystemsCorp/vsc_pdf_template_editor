import 'dart:convert';
import 'dart:typed_data';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_side.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_constraints.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_repeater.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_header.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:basic_utils/basic_utils.dart';

part 'tree_store.g.dart';

class TreeStore = TreeStoreModel with _$TreeStore;

abstract class TreeStoreModel with Store {
  TreeStoreModel(
    this._template,
    this._data,
  ) {
    _mergeTemplate();
    _initTemplateController();
    _initDataController();
    _buildPdf();
  }

  final _templateController = TextEditingController();
  final _dataController = TextEditingController();

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
    } catch (e, s) {
      buildErrorText = '$e \n $s';
    }
  }

  @action
  onDataChanged() {
    _data = jsonDecode(_dataController.text);
    _buildPdf();
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
    } catch (e, s) {
      buildErrorText = '$e \n $s';
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
      case 5:
        map = TplRepeater().toJson();
        break;
      case 6:
        map = TplHeader().toJson();
        break;
    }
    addWidget(map);
  }

  onPropertySelected(int index) {
    Map<String, dynamic> map = {};
    switch (index) {
      case 0:
        map = const TplAlignment().toJson();
        break;
      case 1:
        map = TplEdgeInsets().toJson();
        break;
      case 2:
        map = TplBoxDecoration().toJson();
        break;
      case 3:
        map = TplRadius().toJson();
        break;
      case 4:
        map = TplBoxBorder().toJson();
        break;
      case 5:
        map = TplBoxConstraints().toJson();
        break;
      case 6:
        map = TplBorderStyle().toJson();
        break;
      case 7:
        map = TplBorderRadius().toJson();
        break;
      case 8:
        map = TplBorderSide().toJson();
        break;
      case 9:
        map = TplTextStyle().toJson();
        break;
      case 10:
        map = TplPdfPageFormat().toJson();
        break;
    }
    addWidget(map);
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
      _doc = transformer.Transformer.buildPdf(_template, _data);
      await _savePdf();
      buildErrorText = '';
    } catch (e, s) {
      buildErrorText = '$e \n $s';
    }
  }

  _mergeTemplate() {
    print(jsonEncode(AppConstants.rootTemplate));
    final newMap = StringUtils.addCharAtPosition(
        jsonEncode(AppConstants.rootTemplate), jsonEncode(_template), 235);
    _template = jsonDecode(newMap);
  }
}
