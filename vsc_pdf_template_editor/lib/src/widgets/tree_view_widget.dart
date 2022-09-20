import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import '../models/store.dart';
import '../stores/tree_store.dart';

class TreeViewWidget extends StatefulWidget {
  const TreeViewWidget({Key? key}) : super(key: key);

  @override
  State<TreeViewWidget> createState() => _TreeViewWidgetState();
}

class _TreeViewWidgetState extends State<TreeViewWidget> {
  late VSCStore _store; // MobX tree container

  VSCStore get store => _store;

  TreeViewController? _treeViewController;
  String? _selectedNode;
  final treeStore = TreeStore();

  @override
  void initState() {
    _store = VSCStore(tree: treeStore.buildSampleData());
    _treeViewController =
        TreeViewController(children: store.tree, selectedKey: _selectedNode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: SizedBox(
              width: width * 0.25,
              height: height - 50, //TODO add smart resolving
              child: Observer(
                  builder: (context) => TreeView(
                        controller: _treeViewController!,
                        onNodeTap: (key) => setState(() {
                          print('*** Selected: $key');
                          _selectedNode = key;
                          _treeViewController =
                              _treeViewController!.copyWith(selectedKey: key);
                          treeStore.getWidgetProps(
                              _treeViewController?.selectedNode?.data);
                        }),
                      )),
            ),
          ),
        );
      },
    );
  }
}
