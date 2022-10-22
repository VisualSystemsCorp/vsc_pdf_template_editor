// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeStore on TreeStoreModel, Store {
  late final _$buildErrorTextAtom =
      Atom(name: 'TreeStoreModel.buildErrorText', context: context);

  @override
  String get buildErrorText {
    _$buildErrorTextAtom.reportRead();
    return super.buildErrorText;
  }

  @override
  set buildErrorText(String value) {
    _$buildErrorTextAtom.reportWrite(value, super.buildErrorText, () {
      super.buildErrorText = value;
    });
  }

  late final _$activeTabAtom =
      Atom(name: 'TreeStoreModel.activeTab', context: context);

  @override
  int get activeTab {
    _$activeTabAtom.reportRead();
    return super.activeTab;
  }

  @override
  set activeTab(int value) {
    _$activeTabAtom.reportWrite(value, super.activeTab, () {
      super.activeTab = value;
    });
  }

  late final _$_templateAtom =
      Atom(name: 'TreeStoreModel._template', context: context);

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

  late final _$_dataAtom = Atom(name: 'TreeStoreModel._data', context: context);

  Map<String, dynamic> get data {
    _$_dataAtom.reportRead();
    return super._data;
  }

  @override
  Map<String, dynamic> get _data => data;

  @override
  set _data(Map<String, dynamic> value) {
    _$_dataAtom.reportWrite(value, super._data, () {
      super._data = value;
    });
  }

  late final _$_pdfBytesAtom =
      Atom(name: 'TreeStoreModel._pdfBytes', context: context);

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

  late final _$TreeStoreModelActionController =
      ActionController(name: 'TreeStoreModel', context: context);

  @override
  dynamic onInputChanged() {
    final _$actionInfo = _$TreeStoreModelActionController.startAction(
        name: 'TreeStoreModel.onInputChanged');
    try {
      return super.onInputChanged();
    } finally {
      _$TreeStoreModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDataChanged() {
    final _$actionInfo = _$TreeStoreModelActionController.startAction(
        name: 'TreeStoreModel.onDataChanged');
    try {
      return super.onDataChanged();
    } finally {
      _$TreeStoreModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addWidget(Map<String, dynamic> map) {
    final _$actionInfo = _$TreeStoreModelActionController.startAction(
        name: 'TreeStoreModel.addWidget');
    try {
      return super.addWidget(map);
    } finally {
      _$TreeStoreModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reformat(TextEditingController controller) {
    final _$actionInfo = _$TreeStoreModelActionController.startAction(
        name: 'TreeStoreModel.reformat');
    try {
      return super.reformat(controller);
    } finally {
      _$TreeStoreModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String _reformatNewWidget(String text) {
    final _$actionInfo = _$TreeStoreModelActionController.startAction(
        name: 'TreeStoreModel._reformatNewWidget');
    try {
      return super._reformatNewWidget(text);
    } finally {
      _$TreeStoreModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buildErrorText: ${buildErrorText},
activeTab: ${activeTab}
    ''';
  }
}
