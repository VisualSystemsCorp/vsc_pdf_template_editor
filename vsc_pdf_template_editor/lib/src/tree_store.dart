import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {

  @observable
  List<Node> result = [];

  @action
  List<Node> buildSampleData()  {
    Node leaf1 = const Node(key: '103', label: 'Widget', data: Map<String, dynamic>);// here we need PR for transformer to be merged to access this class TlfText
    Node node1 = Node(key: '102', label: 'Page', children: [leaf1]);
    Node root1 = Node(key: '101', label: 'Document', children: [node1]);


    result = [root1, ];
    return result;
  }

  void getWidgets() {
    buildSampleData();
  }

}