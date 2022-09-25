import 'dart:convert';
import 'dart:typed_data';
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
  bool isLoaded = false;

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

  void setWidgetProps() async {
    widgetProps = await _service.getDataWidget();
    _initWidgetControllers();
    buildPdf('');
  }

  _initWidgetControllers() {
    controllers.clear();
    widgetProps.forEach((key, value) =>
        controllers.add(TextEditingController(text: value.toString())));
  }

  _savePdf() async {
    setPdfBytes = await doc.save();
  }

  buildPdf(String text) async {
    final map = treeViewController.asMap;
    widgetProps['text'] = TplString(value: text);
    doc = transformer.Transformer.buildPdfFromJson(
        map[0], jsonEncode(widgetProps));
    await _savePdf();
  }
}
