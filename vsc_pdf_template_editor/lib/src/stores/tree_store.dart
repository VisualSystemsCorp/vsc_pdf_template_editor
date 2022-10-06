import 'dart:convert';
import 'dart:typed_data';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mobx/mobx.dart';
import '../models/store.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:uuid/uuid.dart';

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {
  _TreeStore(
    this._template,
    this._data,
  ) {
    init();
  }

  final _supportedWidgets = [
    'Text',
    'Sized Box',
    'Container',
  ];
  final Map<String, dynamic> _data;
  final List<TextEditingController> _controllers = [];
  final uuid = const Uuid();

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

  @readonly
  List<String> _selectedNodeProps = [];

  TreeViewController? get treeViewController => _treeViewController;

  List<TextEditingController> get controllers => _controllers;

  List<bool>? get isExpressionOn => _isExpressionOn;

  String? get selectedNode => _selectedNode;

  Uint8List? get pdfBytes => _pdfBytes;

  List<String> get supportedWidgets => _supportedWidgets;

  List<String> get selectedNodeProps => _selectedNodeProps;

  set setPdfBytes(Uint8List? value) {
    _pdfBytes = value;
  }

  void init() {
    _store = VSCStore(tree: buildSampleData());
    _treeViewController =
        TreeViewController(children: _store!.tree, selectedKey: _selectedNode);
    onNodeTap(_selectedNode!);
  }

  @action
  List<Node> buildSampleData() {
    Node? node;
    if (_template.isNotEmpty) {
      node =
          Node(key: uuid.v4(), label: _template['className'], data: _template);
      if (_template.containsKey('child') && _template['child'] != null) {
        node = Node(
            key: uuid.v4(),
            label: _template['className'],
            data: _template,
            children: [
              Node(
                selectedIconColor: Colors.amber,
                key: uuid.v4(),
                label: _template['child']['className'],
                data: _template['child'],
              )
            ]);
      }
    }
    _selectedNode = uuid.v4();
    List<Node> result = [
      Node(key: _selectedNode!, label: 'Document', children: [
        Node(
          key: uuid.v4(),
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
  onInputChanged(String text, int index) {
    if (selectedNodeProps[index] != 'text') {
      treeViewController?.selectedNode?.data
          .update(selectedNodeProps[index], (value) => text);
    } else {
      treeViewController?.selectedNode?.data.update(
          selectedNodeProps[index],
          (value) => TplString(
              value: text, expression: _isExpressionOn![index] ? text : null));
    }

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
        final map = TplSizedBox().toJson();
        _rebuildTemplate(map);
        break;
      case 2:
        final map = TplContainer().toJson();
        _rebuildTemplate(map);
        break;
    }
  }

  @action
  removeWidget() {
    if (selectedNode != null) {
      if (_treeViewController?.selectedNode?.data != null) {
        if (_treeViewController?.selectedNode?.data.containsKey('child') &&
            _treeViewController?.selectedNode?.data['child'] != null) {
          final map = _treeViewController?.selectedNode?.data['child'];
          _template.clear();
          _template.addAll(map);
          _rebuildTemplate(_template);
        } else {
          final newTree = _treeViewController?.deleteNode(selectedNode!);
          final List<Map<String, dynamic>> newList =
              newTree![0].asMap['children'][0]['children'];
          if (newList.isNotEmpty) {
            if (newList[0]['data'] != null) {
              newList[0]['data'].update('child', (value) => null);
            }
            final newMap = newList[0]['data'];
            _rebuildTemplate(newMap);
          } else {
            _template.clear();
            _rebuildTemplate(_template);
            _resetPdf();
          }
        }
      }
    }
  }

  @action
  _setSelectedNodeProps() {
    _selectedNodeProps.clear();
    final list = _treeViewController!.selectedNode!.data.keys.toList();
    for (int i = 0; i < list.length; i++) {
      if (list[i] != 'className' && list[i] != 'child') {
        _selectedNodeProps.add(list[i]);
      }
    }
  }

  _rebuildTemplate(Map<String, dynamic> data) {
    if (_treeViewController!.selectedNode!.data != null &&
        _treeViewController!.selectedNode!.data.containsKey('child')) {
      _template['child'] = data;
    } else if (_treeViewController!.selectedNode!.label == 'Page') {
      _template.clear();
      _template.addAll(data);
    }
    init();
  }

  void setWidgetProps() async {
    _initWidgetControllers();
    _initExpressions();
    _setSelectedNodeProps();
    if (_selectedNodeProps.contains('text')) {
      onInputChanged(_controllers[0].text, 0);
    }
  }

  _initWidgetControllers() {
    _controllers.clear();
    _treeViewController!.selectedNode!.data.forEach((key, value) {
      if (key == 'text') {
        final val = jsonDecode(jsonEncode(value));
        if (val is Map<String, dynamic> &&
            val.containsKey('value') &&
            val.containsKey('expression')) {
          _controllers.add(TextEditingController(
              text: val['expression'] != null && val['expression'].isNotEmpty
                  ? val['expression']
                  : val['value']));
        } else {
          _controllers.add(TextEditingController(text: value.toString()));
        }
      } else if (key != 'className' && key != 'child') {
        _controllers.add(TextEditingController(text: value.toString()));
      }
    });
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
