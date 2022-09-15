import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../api_service.dart';

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {
  final _service = ApiService();
  Map<String, dynamic> widgetProps = <String, dynamic>{};

  @observable
  List<Node> result = [];

  @action
  List<Node> buildSampleData()  {

    _service.getDataWidget().then((value) => widgetProps = value);

    List<Node> _nodes = [
                  Node(key: '101',
                     label: 'Document',
                  children: [
                             Node(
                                   key: '102',
                                 label: 'Page',
                              children: [
                                Node(
                                  key: '103',
                                  label: 'Widget',
                                  data: widgetProps,
                              )],
                             )]),];

    result = _nodes;
    return result;
  }

  void getWidgets() {
    buildSampleData();
  }

}