import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../api_service.dart';

part 'tree_store.g.dart';

class TreeStore = _TreeStore with _$TreeStore;

abstract class _TreeStore with Store {
  final _service = ApiService();

  @observable
  List<Node> result = [];

  @observable
  Map<String, dynamic> widgetProps = <String, dynamic>{};

  @observable
  bool isLoaded = false;

 @action
  Map<String, dynamic> getWidgetProps(Map<String, dynamic> props) {

    widgetProps = props;
    return widgetProps;
 }

 @action
  List<Node> buildSampleData()  {


   List<Node> result = [
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

    isLoaded = true;
    return result;
  }

  void setWidgetProps() {
    Map<String, dynamic> _widgetProps = <String, dynamic>{};
   _service.getDataWidget().then((value) => _widgetProps = value);
    _widgetProps.forEach((key, value) => print ('*** $key : $value'));
   getWidgetProps(_widgetProps);
  }

}