import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mobx/mobx.dart';
import 'package:vsc_pdf_template_editor/src/models/store.dart';

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
    store = VSCStore(tree: buildSampleData());

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
                  child: TreeView(
                    controller: _treeViewController,
                  ),
                ),
              ),
            );
          },
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

  List<Node> buildSampleData() {
    Node leaf1 = Node(key: '103', label: 'Leaf 1', data: Text('test'));// here we need PR for transformer to be merged to access this class TlfText
    Node node1 = Node(key: '102', label: 'Noode 1', children: [leaf1]);
    Node root1 = Node(key: '101', label: 'Root Element 1', children: [node1]);

    Node leaf2 = Node(key: '203', label: 'Leaf 2');
    Node node2 = Node(key: '202', label: 'Noode 2', children: [leaf2]);
    Node root2 = Node(key: '201', label: 'Root Element 2', children: [node2]);

    return [root1, root2];
  }
}
