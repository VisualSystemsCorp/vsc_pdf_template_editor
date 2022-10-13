import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'add_widget_dialog.dart';
import 'edit_param_widget.dart';
import 'pdf_view_widget.dart';
import 'tree_view_widget.dart';

class VscPdfTemplateEditor extends StatelessWidget {
  VscPdfTemplateEditor({
    super.key,
    required this.template,
    required this.data,
  }) {
    viewModel = TreeStore(
      template,
      data,
    );
  }

  final Map<String, dynamic> template;
  final Map<String, dynamic> data;
  late final TreeStore viewModel;

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
                    onPressed: () async {
                      final res = await _onAddWidgetPressed(context);
                      if (res != null) {
                        viewModel.onWidgetSelected(res);
                      }
                    },
                    child: const Text(AppStrings.addWidget)),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: viewModel.removeWidget,
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

  _onAddWidgetPressed(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => AlertDialog(
            title: const Center(child: Text(AppStrings.addWidget)),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.4,
              child: AddWidgetDialog(
                supportedWidgets: viewModel.supportedWidgets,
              ),
            ),
          ));
}