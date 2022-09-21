import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import '../stores/tree_store.dart';

class TreeViewWidget extends StatelessWidget {
  const TreeViewWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final TreeStore viewModel;

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
                  builder: (c) => TreeView(
                      controller: viewModel.treeViewController,
                      onNodeTap: (key) => viewModel.onNodeTap(key)),
                ),
              )),
        );
      },
    );
  }
}
