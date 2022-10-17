import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:vsc_pdf_template_editor/src/utils/map_utils.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
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
    init(buildSampleTemplate());
  }

  final _supportedWidgets = [
    'Text',
    'Sized Box',
    'Container',
    'Column',
    'Row',
  ];
  final Map<String, dynamic> _data;
  final List<TextEditingController> _controllers = [];
  final _templateController = TextEditingController();
  String _pathToMap = '';
  String? _rootKey = '';

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
  Uint8List? _pdfBytes = Uint8List(0);

  @readonly
  List<String> _selectedNodeProps = [];

  final _random = Random();

  TreeViewController? get treeViewController => _treeViewController;

  List<TextEditingController> get controllers => _controllers;

  String? get selectedNode => _selectedNode;

  Uint8List? get pdfBytes => _pdfBytes;

  List<String> get supportedWidgets => _supportedWidgets;

  List<String> get selectedNodeProps => _selectedNodeProps;

  TextEditingController get templateController => _templateController;

  set setPdfBytes(Uint8List? value) {
    _pdfBytes = value;
  }

  set pathToMap(String value) {
    _pathToMap = value;
  }

  void init(List<Node> data) {
    _store = VSCStore(tree: data);
    _treeViewController =
        TreeViewController(children: _store!.tree, selectedKey: _selectedNode);
    onNodeTap(_selectedNode!);
  }

  @action
  List<Node> buildSampleTemplate() {
    Node? node;
    if (_template.isNotEmpty) {
      final key = _generateId();
      node = Node(
          expanded: true,
          key: key,
          label: _template['className'],
          data: _template);
      if (_template.containsKey('id')) {
        _template.update('id', (value) => key);
      } else {
        _template.addAll({'id': key});
      }
      if (_template.containsKey('child') && _template['child'] != null) {
        final key = _generateId();
        final key2 = _generateId();
        if (_template.containsKey('id')) {
          _template.update('id', (value) => key);
        } else {
          _template.addAll({'id': key});
        }
        if (_template['child'].containsKey('id')) {
          _template['child'].update('id', (value) => key2);
        } else {
          _template['child'].addAll({'id': key});
        }
        node = Node(
            expanded: true,
            key: _generateId(),
            label: _template['className'],
            data: _template,
            children: [
              Node(
                expanded: true,
                selectedIconColor: Colors.amber,
                key: _generateId(),
                label: _template['child']['className'],
                data: _template['child'],
              )
            ]);
      } else if (_template.containsKey('children') &&
          _template['children'] != null) {
        final key = _generateId();
        List<Node> children = [];
        if (_template.containsKey('id')) {
          _template.update('id', (value) => key);
        } else {
          _template.addAll({'id': key});
        }
        for (int i = 0; i < _template['children'].length; i++) {
          final key = _generateId();
          children.add(Node(
            expanded: true,
            selectedIconColor: Colors.amber,
            key: key,
            label: _template['children'][i]['className'],
            data: _template['children'][i],
          ));
          if (_template['children'][i].containsKey('id')) {
            _template['children'][i].update('id', (value) => key);
          } else {
            _template['children'][i].addAll({'id': key});
          }
        }
        node = Node(
            expanded: true,
            key: key,
            label: _template['className'],
            data: _template,
            children: children);
      }
    }
    _selectedNode = _generateId();
    _rootKey = _selectedNode;
    List<Node> result = [
      Node(expanded: true, key: _selectedNode!, label: 'Document', children: [
        Node(
          expanded: true,
          key: _generateId(),
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
  onInputChanged(String text, int index) {
    treeViewController?.selectedNode?.data.update(
        selectedNodeProps[index], (value) => TplString(expression: text));

    _buildPdf();
  }

  @action
  onWidgetSelected(int index) {
    bool isAddingAllowed = treeViewController?.selectedNode?.label == 'Page' &&
            treeViewController!.selectedNode!.children.isEmpty ||
        _treeViewController!.selectedNode!.data != null &&
            _treeViewController!.selectedNode!.data.containsKey('child') &&
            _treeViewController!.selectedNode!.data['child'] == null ||
        _treeViewController!.selectedNode!.data != null &&
            _treeViewController!.selectedNode!.data.containsKey('child') &&
            _treeViewController!.selectedNode!.data['child'].isEmpty ||
        _treeViewController!.selectedNode!.data.containsKey('children') &&
            _treeViewController!.selectedNode!.data['children'] == null ||
        _treeViewController!.selectedNode!.data != null &&
            _treeViewController!.selectedNode!.data.containsKey('children') &&
            _treeViewController!.selectedNode!.data['children'].isEmpty;
    if (isAddingAllowed) {
      Map<String, dynamic> map = {};
      switch (index) {
        case 0:
          map = TplText(id: _generateId(), text: TplString(expression: ''))
              .toJson();
          break;
        case 1:
          map = TplSizedBox(id: _generateId()).toJson();
          break;
        case 2:
          map = TplContainer(id: _generateId()).toJson();
          break;
        case 3:
          map = TplColumn(id: _generateId()).toJson();
          break;
        case 4:
          map = TplRow(id: _generateId()).toJson();
          break;
      }
      addWidget(map);
    }
  }

  @action
  addWidget(Map<String, dynamic> map) {
    if (treeViewController?.selectedNode?.label == 'Page') {
      _template.addAll(map);
      final newTree = _treeViewController?.addNode(
          _selectedNode!,
          Node(
              expanded: true,
              key: _template['id'],
              label: _template['className'],
              data: _template));
      init(newTree!);
    } else {
      _pathToMap = '';
      String searchedId = '';
      for (;;) {
        final nested = getMap(_template, _pathToMap, _template);
        if (nested is Map) {
          searchedId = _searchMap(nested as Map<String, dynamic>);
        } else {
          for (int i = 0; i < nested.length; i++) {
            final map = nested[i];
            searchedId = map['id'];
            if (searchedId == _selectedNode) {
              if (map.containsKey('child')) {
                pathToMap = '$_pathToMap.[$i].child';
              } else {
                pathToMap = '$_pathToMap.[$i].children';
              }
              break;
            }
          }
        }
        if (searchedId == _selectedNode) break;
      }

      if (_pathToMap.endsWith('children')) {
        final list = getMap(_template, _pathToMap, _template);
        if (list == null || list.isEmpty) {
          _template = setMap(_template, _pathToMap, [map]);
        } else {
          list.add(map);
        }
      } else {
        _template = setMap(_template, _pathToMap, map);
      }

      final newTree = _treeViewController?.addNode(
          _selectedNode!,
          Node(
              expanded: true,
              key: map['id'],
              label: map['className'],
              data: map));
      init(newTree!);
    }
    _buildPdf();
  }

  @action
  removeWidget() {
    if (selectedNode != null) {
      _pathToMap = '';
      String searchedId = '';
      for (;;) {
        final map = getMap(_template, _pathToMap, _template);
        searchedId = _searchMap(map!);

        if (searchedId == _selectedNode) break;
      }

      if (_pathToMap.isNotEmpty) {
        _template = setMap(_template, _pathToMap, null);
      } else {
        _template.clear();
        _resetPdf();
      }
      final newTree = _treeViewController?.deleteNode(selectedNode!);
      _selectedNode = _rootKey;
      init(newTree!);
    }
    _buildPdf();
  }

  @action
  _setSelectedNodeProps() {
    _selectedNodeProps.clear();
    final list = _treeViewController!.selectedNode!.data.keys.toList();
    for (int i = 0; i < list.length; i++) {
      if (list[i] != 'className' &&
          list[i] != 'child' &&
          list[i] != 'children' &&
          list[i] != 'id') {
        _selectedNodeProps.add(list[i]);
      }
    }
  }

  @action
  updateTreeView(List<Node> updated) {
    _treeViewController = _treeViewController!.copyWith(children: updated);
  }

  @action
  reformat() {}

  _resetPdf() {
    setPdfBytes = null;
  }

  void setWidgetProps() async {
    _initWidgetControllers();
    _setSelectedNodeProps();
    if (_selectedNodeProps.contains('text')) {
      onInputChanged(_controllers[0].text, 0);
    }
  }

  _initWidgetControllers() {
    _controllers.clear();
    _treeViewController!.selectedNode!.data.forEach((key, value) {
      if (key != 'className' &&
          key != 'child' &&
          key != 'children' &&
          key != 'id') {
        final val = jsonDecode(jsonEncode(value));
        if (val is Map<String, dynamic> && val.containsKey('expression')) {
          _controllers.add(TextEditingController(text: val['expression']));
        } else {
          _controllers.add(TextEditingController(text: value.toString()));
        }
      }
    });
  }

  _savePdf() async {
    setPdfBytes = await _doc.save();
  }

  _buildPdf() async {
    _doc = transformer.Transformer.buildPdf(_template, _data);
    await _savePdf();
  }

  String _generateId() {
    return _random.nextInt(4294967296).toString();
  }

  String _searchMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      if (key == 'child' || key == 'children') {
        pathToMap = _pathToMap.isEmpty ? key : '$_pathToMap.$key';
      }
    });
    return map['id'];
  }
}
