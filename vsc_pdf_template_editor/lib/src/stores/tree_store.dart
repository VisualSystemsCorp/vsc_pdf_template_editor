import 'dart:typed_data';
import 'package:expressions/expressions.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mobx/mobx.dart';
import '../api_service.dart';
import '../models/store.dart';
import 'package:pdf/widgets.dart' as pw;

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {
  _TreeStore() {
    init();
  }

  final _service = ApiService();
  final evaluator = const ExpressionEvaluator();
  final List<TextEditingController> controllers = [];
  late VSCStore store; // MobX tree container
  late TreeViewController treeViewController;
  pw.Document doc = pw.Document();

  @observable
  String? selectedNode;

  @observable
  List<Node> result = [];

  @observable
  Map<String, dynamic> widgetProps = <String, dynamic>{};

  @observable
  Map<String, dynamic> expressionContext = <String, dynamic>{};

  @observable
  bool isLoaded = false;

  @observable
  bool isExpressionOn = false;

  @readonly
  Uint8List _pdfBytes = Uint8List(0);

  Uint8List get pdfBytes => _pdfBytes;

  set setPdfBytes(Uint8List value) {
    _pdfBytes = value;
  }

  void init() {
    store = VSCStore(tree: buildSampleData());
    treeViewController =
        TreeViewController(children: store.tree, selectedKey: selectedNode);
    _initWidgetControllers();
  }

  @action
  Map<String, dynamic> getWidgetProps(Map<String, dynamic> props) {
    widgetProps = props;
    return widgetProps;
  }

  @action
  List<Node> buildSampleData() {
    List<Node> result = [
      Node(key: '101', label: 'Document', children: [
        Node(
          key: '102',
          label: 'Page',
          children: [
            Node(
              key: '103',
              label: 'Text',
              data: widgetProps,
            )
          ],
        )
      ]),
    ];

    isLoaded = true;
    return result;
  }

  @action
  onNodeTap(String key) {
    if (key != selectedNode) {
      print('*** Selected: $key');
      selectedNode = key;
      treeViewController = treeViewController.copyWith(selectedKey: key);
      setWidgetProps();
    }
  }

  @action
  void toggleExpressionSwitch(bool val) {
    isExpressionOn = val;
  }

  void setWidgetProps() async {
    widgetProps = await _service.getDataWidget();
    expressionContext = await _service.getSampleExpressionContext();
    _initWidgetControllers();
    onInputChanged('');
  }

  _initWidgetControllers() {
    controllers.clear();
    widgetProps.forEach((key, value) =>
        controllers.add(TextEditingController(text: value.toString())));
  }

  _savePdf() async {
    setPdfBytes = await doc.save();
  }

  onInputChanged(String text) {
    String? res;
    if (isExpressionOn) {
      res = transformer.Transformer.evaluateInput(text, expressionContext);
    }
    final map = treeViewController.asMap;
    widgetProps['text'] = TplString(value: text, expression: res);
    _buildPdf(map[0]);
  }

  _buildPdf(Map<String, dynamic> treeRoot) async {
    doc = transformer.Transformer.buildPdf(widgetProps);
    await _savePdf();
  }
}
