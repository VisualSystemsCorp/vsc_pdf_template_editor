import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:vsc_pdf_template_editor/src/widgets/json_editor_widget.dart';
import 'add_widget_dialog.dart';
import 'pdf_view_widget.dart';

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
                  width: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final res = await _onAddPropertyPressed(context);
                      if (res != null) {
                        viewModel.onPropertySelected(res);
                      }
                    },
                    child: const Text(AppStrings.addProperty)),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                    onPressed: () => viewModel.activeTab == 0
                        ? viewModel.reformat(viewModel.templateController)
                        : viewModel.reformat(viewModel.dataController),
                    child: const Text(AppStrings.reformat)),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: JsonEditorWidget(
                    viewModel: viewModel,
                    data: data.toString(),
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                Expanded(
                  child: PdfViewWidget(
                    viewModel: viewModel,
                  ),
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
      builder: (c) => AlertDialog(
            title: const Center(child: Text(AppStrings.addWidget)),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.4,
              child: const AddWidgetDialog(
                items: AppConstants.supportedWidgets,
              ),
            ),
          ));

  _onAddPropertyPressed(BuildContext context) => showDialog(
      context: context,
      builder: (c) => AlertDialog(
            title: const Center(child: Text(AppStrings.addProperty)),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.4,
              child: const AddWidgetDialog(
                items: AppConstants.supportedProperties,
              ),
            ),
          ));
}
