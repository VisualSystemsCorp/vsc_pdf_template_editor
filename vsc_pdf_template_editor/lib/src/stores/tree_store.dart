import 'dart:typed_data';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mobx/mobx.dart';
import '../models/store.dart';
import 'package:pdf/widgets.dart' as pw;

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {
  _TreeStore(
    this._template,
    this._data,
  ) {
    init();
  }

  final _supportedWidgets = ['Text', 'Sized Box'];
  final Map<String, dynamic> _data;
  final List<TextEditingController> _controllers = [];

  @readonly
  VSCStore? _store;

  @readonly
  TreeViewController? _treeViewController;
  pw.Document _doc = pw.Document();

  @readonly
  String? _selectedNode;

  @readonly
  Map<String, dynamic> _template;

  @readonly
  ObservableList<bool>? _isExpressionOn;

  @readonly
  Uint8List? _pdfBytes = Uint8List(0);

  TreeViewController? get treeViewController => _treeViewController;

  List<TextEditingController> get controllers => _controllers;

  List<bool>? get isExpressionOn => _isExpressionOn;

  String? get selectedNode => _selectedNode;

  Uint8List? get pdfBytes => _pdfBytes;

  List<String> get supportedWidgets => _supportedWidgets;

  set setPdfBytes(Uint8List? value) {
    _pdfBytes = value;
  }

  void init() {
    _store = VSCStore(tree: buildSampleData());
    _treeViewController =
        TreeViewController(children: _store!.tree, selectedKey: _selectedNode);
    onNodeTap('101');
  }

  @action
  Map<String, dynamic> getWidgetProps(Map<String, dynamic> props) {
    _template = props;
    return _template;
  }

  @action
  List<Node> buildSampleData() {
    Node? node;
    if (_template.isNotEmpty) {
      node = Node(key: '103', label: _template['className'], data: _template);
      if (_template.containsKey('child')) {
        node = Node(
            key: '103',
            label: _template['className'],
            data: _template,
            children: [
              Node(
                selectedIconColor: Colors.amber,
                key: '104',
                label: _template['child']['className'],
                data: _template['child'],
              )
            ]);
      }
    }
    List<Node> result = [
      Node(key: '101', label: 'Document', children: [
        Node(
          key: '102',
          label: 'Page',
          children: node == null ? [] : [node],
        )
      ]),
    ];
    return result;
  }

  @action
  onNodeTap(String key) {
    if (key != _selectedNode) {
      _selectedNode = key;
      _treeViewController = _treeViewController?.copyWith(selectedKey: key);
      if (_treeViewController!.selectedNode!.hasData) {
        setWidgetProps();
      }
    }
  }

  @action
  void toggleExpressionSwitch(int index, bool val) {
    _isExpressionOn![index] = val;
  }

  @action
  onInputChanged(String text, int? index) {
    _treeViewController?.selectedNode?.data.update(
        'text',
        (value) => TplString(
            value: text,
            expression: index != null
                ? _isExpressionOn![index]
                    ? text
                    : null
                : null));

    _buildPdf();
  }

  @action
  addWidget(int index) {
    switch (index) {
      case 0:
        final map = TplText(text: TplString(value: '')).toJson();
        _rebuildTemplate(map);
        break;
      case 1:
        final map = TplSizedBox(
                child: TplText(text: TplString(value: 'text in a sized box')))
            .toJson();
        _rebuildTemplate(map);
        break;
    }
  }

  @action
  removeWidget() {
    _rebuildTemplate({});
    _resetPdf();
  }

  _rebuildTemplate(Map<String, dynamic> data) {
    _template.clear();
    _template.addAll(data);
    init();
  }

  void setWidgetProps() async {
    _initWidgetControllers();
    _initExpressions();
    if (_template.containsKey('text')) {
      if (_template['text'] is String) {
        onInputChanged(_template['text'], null);
      } else {
        onInputChanged(_template['text']['value'], null);
      }
    } else {
      _buildPdf();
    }
  }

  _initWidgetControllers() {
    _controllers.clear();
    _treeViewController!.selectedNode!.data.forEach((key, value) =>
        _controllers.add(TextEditingController(text: value.toString())));
  }

  _initExpressions() {
    _isExpressionOn = ObservableList<bool>();
    for (var e in controllers) {
      _isExpressionOn?.add(false);
    }
  }

  _savePdf() async {
    setPdfBytes = await _doc.save();
  }

  _buildPdf() async {
    _doc = transformer.Transformer.buildPdf(_template, _data);
    await _savePdf();
  }

  _resetPdf() {
    setPdfBytes = null;
  }
}
