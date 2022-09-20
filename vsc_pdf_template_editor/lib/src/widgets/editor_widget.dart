import 'package:flutter/material.dart';
import 'edit_param_widget.dart';
import 'pdf_view_widget.dart';
import 'tree_view_widget.dart';

class EditorWidget extends StatelessWidget {
  const EditorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        TreeViewWidget(),
        VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        Expanded(
          child: PdfViewWidget(),
        ),
        VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        EditParamWidget(),
      ],
    );
  }
}
