// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeStore on _TreeStore, Store {
  late final _$selectedNodeAtom =
      Atom(name: '_TreeStore.selectedNode', context: context);

  @override
  String? get selectedNode {
    _$selectedNodeAtom.reportRead();
    return super.selectedNode;
  }

  @override
  set selectedNode(String? value) {
    _$selectedNodeAtom.reportWrite(value, super.selectedNode, () {
      super.selectedNode = value;
    });
  }

  late final _$resultAtom = Atom(name: '_TreeStore.result', context: context);

  @override
  List<Node<dynamic>> get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(List<Node<dynamic>> value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$widgetPropsAtom =
      Atom(name: '_TreeStore.widgetProps', context: context);

  @override
  Map<String, dynamic> get widgetProps {
    _$widgetPropsAtom.reportRead();
    return super.widgetProps;
  }

  @override
  set widgetProps(Map<String, dynamic> value) {
    _$widgetPropsAtom.reportWrite(value, super.widgetProps, () {
      super.widgetProps = value;
    });
  }

  late final _$isLoadedAtom =
      Atom(name: '_TreeStore.isLoaded', context: context);

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
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
  String toString() {
    return '''
selectedNode: ${selectedNode},
result: ${result},
widgetProps: ${widgetProps},
isLoaded: ${isLoaded}
    ''';
  }
}
