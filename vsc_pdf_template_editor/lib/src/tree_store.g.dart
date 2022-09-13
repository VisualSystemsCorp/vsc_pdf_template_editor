// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeStore on _TreeStore, Store {
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

  late final _$_TreeStoreActionController =
      ActionController(name: '_TreeStore', context: context);

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
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
