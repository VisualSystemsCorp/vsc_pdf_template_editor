import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/view_model.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:vsc_pdf_template_editor/src/widgets/json_editor_widget.dart';

import 'add_widget_dialog.dart';
import 'pdf_view_widget.dart';

class VscPdfTemplateEditor extends StatefulWidget {
  const VscPdfTemplateEditor({
    super.key,
    required this.template,
    required this.data,
    this.codeFieldTextStyle,
    this.onTemplateChanged,
    this.onDataChanged,
    this.onErrorStateChanged,
  });

  final Map<String, dynamic> template;
  final Map<String, dynamic> data;
  final TextStyle? codeFieldTextStyle;
  final void Function(Map<String, dynamic> template)? onTemplateChanged;
  final void Function(Map<String, dynamic> data)? onDataChanged;
  final void Function(bool hasError)? onErrorStateChanged;

  @override
  State<VscPdfTemplateEditor> createState() => _VscPdfTemplateEditorState();
}

class _VscPdfTemplateEditorState extends State<VscPdfTemplateEditor> {
  late final ViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ViewModel(
      widget.template,
      widget.data,
      widget.onTemplateChanged,
      widget.onDataChanged,
      widget.onErrorStateChanged,
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final activeTab = viewModel.activeTab;
      final templateTabActive = activeTab == 0;
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: templateTabActive
                        ? () async {
                            final res = await _onAddWidgetPressed(context);
                            if (res != null) {
                              print(res);
                              viewModel.onWidgetSelected(res);
                            }
                          }
                        : null,
                    child: const Text(AppStrings.addWidget)),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                    onPressed: templateTabActive
                        ? () async {
                            final res = await _onAddPropertyPressed(context);
                            if (res != null) {
                              viewModel.onPropertySelected(res);
                            }
                          }
                        : null,
                    child: const Text(AppStrings.addProperty)),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                    onPressed: templateTabActive
                        ? () async {
                            final type = await _onAddImagePressed(context);
                            if (type != null) {
                              final res =
                                  await _pickImage() as FilePickerResult?;
                              if (res != null) {
                                final file = res.files.first.bytes!;
                                viewModel.insertImage(file, type);
                              }
                            }
                          }
                        : null,
                    child: const Text(AppStrings.addImage)),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                    onPressed: () => templateTabActive
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
                    data: widget.data.toString(),
                    codeFieldTextStyle: widget.codeFieldTextStyle,
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
              height: MediaQuery.of(context).size.height * 0.9,
              child: AddWidgetDialog(
                items: viewModel.supportedWidgets,
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
              height: MediaQuery.of(context).size.height * 0.9,
              child: AddWidgetDialog(
                items: viewModel.supportedProperties,
              ),
            ),
          ));

  _onAddImagePressed(BuildContext context) => showDialog(
      context: context,
      builder: (c) => AlertDialog(
            title: const Center(child: Text(AppStrings.addImage)),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.9,
              child: AddWidgetDialog(
                items: AppConstants.supportedImages,
              ),
            ),
          ));

  _pickImage() async =>
      await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
}
