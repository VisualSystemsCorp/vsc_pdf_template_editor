import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'edit_param_widget.dart';
import 'pdf_view_widget.dart';
import 'tree_view_widget.dart';

class EditorWidget extends StatelessWidget {
  EditorWidget({Key? key}) : super(key: key);

  final viewModel = TreeStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text(AppStrings.addWidget)),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(AppStrings.removeWidget)),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {}, child: const Text(AppStrings.undo)),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text(AppStrings.redo)),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TreeViewWidget(
                  viewModel: viewModel,
                ),
                const VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                Expanded(
                  child: PdfViewWidget(
                    viewModel: viewModel,
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                EditParamWidget(
                  viewModel: viewModel,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
