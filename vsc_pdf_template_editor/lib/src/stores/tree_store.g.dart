// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeStore on _TreeStore, Store {
  late final _$_storeAtom = Atom(name: '_TreeStore._store', context: context);

  VSCStore? get store {
    _$_storeAtom.reportRead();
    return super._store;
  }

  @override
  VSCStore? get _store => store;

  @override
  set _store(VSCStore? value) {
    _$_storeAtom.reportWrite(value, super._store, () {
      super._store = value;
    });
  }

  late final _$_treeViewControllerAtom =
      Atom(name: '_TreeStore._treeViewController', context: context);

  TreeViewController? get treeViewController {
    _$_treeViewControllerAtom.reportRead();
    return super._treeViewController;
  }

  @override
  TreeViewController? get _treeViewController => treeViewController;

  @override
  set _treeViewController(TreeViewController? value) {
    _$_treeViewControllerAtom.reportWrite(value, super._treeViewController, () {
      super._treeViewController = value;
    });
  }

  late final _$_selectedNodeAtom =
      Atom(name: '_TreeStore._selectedNode', context: context);

  String? get selectedNode {
    _$_selectedNodeAtom.reportRead();
    return super._selectedNode;
  }

  @override
  String? get _selectedNode => selectedNode;

  @override
  set _selectedNode(String? value) {
    _$_selectedNodeAtom.reportWrite(value, super._selectedNode, () {
      super._selectedNode = value;
    });
  }

  late final _$_templateAtom =
      Atom(name: '_TreeStore._template', context: context);

  Map<String, dynamic> get template {
    _$_templateAtom.reportRead();
    return super._template;
  }

  @override
  Map<String, dynamic> get _template => template;

  @override
  set _template(Map<String, dynamic> value) {
    _$_templateAtom.reportWrite(value, super._template, () {
      super._template = value;
    });
  }

  late final _$_pdfBytesAtom =
      Atom(name: '_TreeStore._pdfBytes', context: context);

  Uint8List? get pdfBytes {
    _$_pdfBytesAtom.reportRead();
    return super._pdfBytes;
  }

  @override
  Uint8List? get _pdfBytes => pdfBytes;

  @override
  set _pdfBytes(Uint8List? value) {
    _$_pdfBytesAtom.reportWrite(value, super._pdfBytes, () {
      super._pdfBytes = value;
    });
  }

  late final _$_selectedNodePropsAtom =
      Atom(name: '_TreeStore._selectedNodeProps', context: context);

  List<String> get selectedNodeProps {
    _$_selectedNodePropsAtom.reportRead();
    return super._selectedNodeProps;
  }

  @override
  List<String> get _selectedNodeProps => selectedNodeProps;

  @override
  set _selectedNodeProps(List<String> value) {
    _$_selectedNodePropsAtom.reportWrite(value, super._selectedNodeProps, () {
      super._selectedNodeProps = value;
    });
  }

  late final _$_TreeStoreActionController =
      ActionController(name: '_TreeStore', context: context);

  @override
  List<Node<dynamic>> buildSampleTemplate() {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.buildSampleTemplate');
    try {
      return super.buildSampleTemplate();
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNodeTap(String key) {
    final _$actionInfo =
        _$_TreeStoreActionController.startAction(name: '_TreeStore.onNodeTap');
    try {
      return super.onNodeTap(key);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInputChanged(String text, int index) {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.onInputChanged');
    try {
      return super.onInputChanged(text, index);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onWidgetSelected(int index) {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.onWidgetSelected');
    try {
      return super.onWidgetSelected(index);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addWidget(Map<String, dynamic> map) {
    final _$actionInfo =
        _$_TreeStoreActionController.startAction(name: '_TreeStore.addWidget');
    try {
      return super.addWidget(map);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeWidget() {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.removeWidget');
    try {
      return super.removeWidget();
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setSelectedNodeProps() {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore._setSelectedNodeProps');
    try {
      return super._setSelectedNodeProps();
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateTreeView(List<Node<dynamic>> updated) {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.updateTreeView');
    try {
      return super.updateTreeView(updated);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
