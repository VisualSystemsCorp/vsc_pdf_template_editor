// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModel on BaseViewModel, Store {
  late final _$buildErrorTextAtom =
      Atom(name: 'BaseViewModel.buildErrorText', context: context);

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
      Atom(name: 'BaseViewModel.activeTab', context: context);

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
      Atom(name: 'BaseViewModel._template', context: context);

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

  late final _$_dataAtom = Atom(name: 'BaseViewModel._data', context: context);

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
      Atom(name: 'BaseViewModel._pdfBytes', context: context);

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

  late final _$_supportedWidgetsAtom =
      Atom(name: 'BaseViewModel._supportedWidgets', context: context);

  List<String> get supportedWidgets {
    _$_supportedWidgetsAtom.reportRead();
    return super._supportedWidgets;
  }

  @override
  List<String> get _supportedWidgets => supportedWidgets;

  @override
  set _supportedWidgets(List<String> value) {
    _$_supportedWidgetsAtom.reportWrite(value, super._supportedWidgets, () {
      super._supportedWidgets = value;
    });
  }

  late final _$_supportedPropertiesAtom =
      Atom(name: 'BaseViewModel._supportedProperties', context: context);

  List<String> get supportedProperties {
    _$_supportedPropertiesAtom.reportRead();
    return super._supportedProperties;
  }

  @override
  List<String> get _supportedProperties => supportedProperties;

  @override
  set _supportedProperties(List<String> value) {
    _$_supportedPropertiesAtom.reportWrite(value, super._supportedProperties,
        () {
      super._supportedProperties = value;
    });
  }

  late final _$_onTemplateChangedAsyncAction =
      AsyncAction('BaseViewModel._onTemplateChanged', context: context);

  @override
  Future<void> _onTemplateChanged() {
    return _$_onTemplateChangedAsyncAction
        .run(() => super._onTemplateChanged());
  }

  late final _$_onDataChangedAsyncAction =
      AsyncAction('BaseViewModel._onDataChanged', context: context);

  @override
  Future<void> _onDataChanged() {
    return _$_onDataChangedAsyncAction.run(() => super._onDataChanged());
  }

  late final _$addObjectAsyncAction =
      AsyncAction('BaseViewModel.addObject', context: context);

  @override
  Future<void> addObject(Map<String, dynamic> map) {
    return _$addObjectAsyncAction.run(() => super.addObject(map));
  }

  late final _$BaseViewModelActionController =
      ActionController(name: 'BaseViewModel', context: context);

  @override
  void _setBuildErrorText(Object e, [StackTrace? st]) {
    final _$actionInfo = _$BaseViewModelActionController.startAction(
        name: 'BaseViewModel._setBuildErrorText');
    try {
      return super._setBuildErrorText(e, st);
    } finally {
      _$BaseViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reformat(CodeController controller) {
    final _$actionInfo = _$BaseViewModelActionController.startAction(
        name: 'BaseViewModel.reformat');
    try {
      return super.reformat(controller);
    } finally {
      _$BaseViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String _reformatNewWidget(String text) {
    final _$actionInfo = _$BaseViewModelActionController.startAction(
        name: 'BaseViewModel._reformatNewWidget');
    try {
      return super._reformatNewWidget(text);
    } finally {
      _$BaseViewModelActionController.endAction(_$actionInfo);
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
