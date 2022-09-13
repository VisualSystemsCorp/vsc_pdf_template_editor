import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {
//  _TreeStore(this.widgets);

  @observable
  List<Node> result = [];

  @action
  List<Node> buildSampleData()  {
    Node leaf1 = const Node(key: '103', label: 'Leaf 1', data: Text('test'));// here we need PR for transformer to be merged to access this class TlfText
    Node node1 = Node(key: '102', label: 'Noode 1', children: [leaf1]);
    Node root1 = Node(key: '101', label: 'Root Element 1', children: [node1]);

    Node leaf2 = const Node(key: '203', label: 'Leaf 2');
    Node node2 = Node(key: '202', label: 'Noode 2', children: [leaf2]);
    Node root2 = Node(key: '201', label: 'Root Element 2', children: [node2]);

    result = [root1, root2];

    return result;
  }

  void getWidgets() {
    buildSampleData();
  }

}