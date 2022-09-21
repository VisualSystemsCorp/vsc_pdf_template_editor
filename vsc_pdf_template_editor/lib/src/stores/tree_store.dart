import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mobx/mobx.dart';
import '../api_service.dart';
import '../models/store.dart';

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

  @observable
  String? selectedNode;

  @observable
  List<Node> result = [];

  @observable
  Map<String, dynamic> widgetProps = <String, dynamic>{};

  @observable
  bool isLoaded = false;

  void init() {
    store = VSCStore(tree: buildSampleData());
    treeViewController =
        TreeViewController(children: store.tree, selectedKey: selectedNode);
    widgetProps
        .forEach((key, value) => controllers.add(TextEditingController()));
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
    print('*** Selected: $key');
    selectedNode = key;
    treeViewController = treeViewController.copyWith(selectedKey: key);
    getWidgetProps(treeViewController.selectedNode?.data);
  }

  void setWidgetProps() {
    Map<String, dynamic> widgetProps = <String, dynamic>{};
    _service.getDataWidget().then((value) => widgetProps = value);
    widgetProps.forEach((key, value) => print('*** $key : $value'));
    getWidgetProps(widgetProps);
  }
}
