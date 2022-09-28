// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeStore on _TreeStore, Store {
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

  late final _$_widgetPropsAtom =
      Atom(name: '_TreeStore._widgetProps', context: context);

  Map<String, dynamic> get widgetProps {
    _$_widgetPropsAtom.reportRead();
    return super._widgetProps;
  }

  @override
  Map<String, dynamic> get _widgetProps => widgetProps;

  @override
  set _widgetProps(Map<String, dynamic> value) {
    _$_widgetPropsAtom.reportWrite(value, super._widgetProps, () {
      super._widgetProps = value;
    });
  }

  late final _$isExpressionOnAtom =
      Atom(name: '_TreeStore.isExpressionOn', context: context);

  @override
  bool get isExpressionOn {
    _$isExpressionOnAtom.reportRead();
    return super.isExpressionOn;
  }

  @override
  set isExpressionOn(bool value) {
    _$isExpressionOnAtom.reportWrite(value, super.isExpressionOn, () {
      super.isExpressionOn = value;
    });
  }

  late final _$_pdfBytesAtom =
      Atom(name: '_TreeStore._pdfBytes', context: context);

  Uint8List get pdfBytes {
    _$_pdfBytesAtom.reportRead();
    return super._pdfBytes;
  }

  @override
  Uint8List get _pdfBytes => pdfBytes;

  @override
  set _pdfBytes(Uint8List value) {
    _$_pdfBytesAtom.reportWrite(value, super._pdfBytes, () {
      super._pdfBytes = value;
    });
  }

  late final _$_TreeStoreActionController =
      ActionController(name: '_TreeStore', context: context);

  @override
  Map<String, dynamic> getWidgetProps(Map<String, dynamic> props) {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.getWidgetProps');
    try {
      return super.getWidgetProps(props);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Node<dynamic>> buildSampleData() {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.buildSampleData');
    try {
      return super.buildSampleData();
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
  void toggleExpressionSwitch(bool val) {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.toggleExpressionSwitch');
    try {
      return super.toggleExpressionSwitch(val);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInputChanged(String text) {
    final _$actionInfo = _$_TreeStoreActionController.startAction(
        name: '_TreeStore.onInputChanged');
    try {
      return super.onInputChanged(text);
    } finally {
      _$_TreeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isExpressionOn: ${isExpressionOn}
    ''';
  }
}
