import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vsc_pdf_template_editor/src/models/store.dart';

import '../tree_store.dart';

class EditorWidget extends StatefulWidget {
  const EditorWidget({Key? key}) : super(key: key);

  @override
  State<EditorWidget> createState() => _EditorWidgetState();
}

class _EditorWidgetState extends State<EditorWidget> {

  @observable
  late VSCStore store; // MobX tree container

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final treeStore = TreeStore().buildSampleData();
    store = VSCStore(tree: treeStore);

    final _treeViewController = TreeViewController(children: store.tree);

    final _width = MediaQuery
        .of(context)
        .size
        .width;
    final _height = MediaQuery
        .of(context)
        .size
        .height;
    return Row(
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: SizedBox(
                  width: _width * 0.25,
                  height: _height - 50, //TODO add smart resolving
                  child: Observer(builder: (_) =>
                  TreeView(
                    controller: _treeViewController,
                  )),
                ),
              ),
            );
          },
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
