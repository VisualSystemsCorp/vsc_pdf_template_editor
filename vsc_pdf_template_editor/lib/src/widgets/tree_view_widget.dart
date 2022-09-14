import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mobx/mobx.dart';

import '../models/store.dart';
import '../tree_store.dart';

class TreeViewWidget extends StatefulWidget {
  const TreeViewWidget({Key? key}) : super(key: key);

  @override
  State<TreeViewWidget> createState() => _TreeViewWidgetState();
}

class _TreeViewWidgetState extends State<TreeViewWidget> {

  @observable
  late VSCStore _store; // MobX tree container

  @computed
  VSCStore get store => _store;

  TreeViewController? _treeViewController;
  String? _selectedNode;
  final treeStore = TreeStore().buildSampleData();


  @override
  void initState() {
    _store = VSCStore(tree: treeStore);
    _treeViewController =
        TreeViewController(children: store.tree, selectedKey: _selectedNode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: SizedBox(
              width: _width * 0.25,
              height: _height - 50, //TODO add smart resolving
              child: Observer(
                  builder: (_) => TreeView(
                    controller: _treeViewController!,
                    onNodeTap: (key) => setState(() {
                      print('*** Selected: $key');
                      _selectedNode = key;
                      _treeViewController = _treeViewController!.copyWith(selectedKey: key);
                    }),
                  )),
            ),
          ),
        );
      },
    );
  }
}
