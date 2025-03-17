import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/view_model.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:vsc_pdf_template_editor/src/widgets/designer_widget.dart';
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
  bool _useDesignerMode = true;
  
  // Splitter control properties
  double _leftPaneWidth = 0.5; // Represents 50% of available width
  bool _isResizing = false;

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
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                    onPressed: templateTabActive 
                        ? () {
                            setState(() {
                              _useDesignerMode = !_useDesignerMode;
                            });
                          }
                        : null,
                    child: Text(_useDesignerMode 
                        ? 'Switch to JSON Editor' 
                        : 'Switch to Designer')),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate actual widths based on the constraint width and ratio
                final availableWidth = constraints.maxWidth;
                final leftWidth = availableWidth * _leftPaneWidth;
                final rightWidth = availableWidth - leftWidth - 10; // 10px for splitter
                
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Left pane (designer or JSON editor)
                    SizedBox(
                      width: leftWidth,
                      child: templateTabActive && _useDesignerMode
                          ? DesignerWidget(
                              viewModel: viewModel,
                            )
                          : JsonEditorWidget(
                              viewModel: viewModel,
                              data: widget.data.toString(),
                              codeFieldTextStyle: widget.codeFieldTextStyle,
                            ),
                    ),
                    
                    // Splitter control
                    GestureDetector(
                      onHorizontalDragStart: (details) {
                        setState(() {
                          _isResizing = true;
                        });
                      },
                      onHorizontalDragUpdate: (details) {
                        setState(() {
                          // Calculate new ratio based on drag
                          _leftPaneWidth += details.delta.dx / availableWidth;
                          
                          // Clamp values to prevent extremes
                          if (_leftPaneWidth < 0.2) _leftPaneWidth = 0.2; // Minimum 20%
                          if (_leftPaneWidth > 0.8) _leftPaneWidth = 0.8; // Maximum 80%
                        });
                      },
                      onHorizontalDragEnd: (details) {
                        setState(() {
                          _isResizing = false;
                        });
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeLeftRight,
                        child: Container(
                          width: 10,
                          height: double.infinity,
                          color: _isResizing ? Colors.blue : Colors.grey[300],
                          child: Center(
                            child: Container(
                              width: 3,
                              height: 50,
                              decoration: BoxDecoration(
                                color: _isResizing ? Colors.blue[700] : Colors.grey[400],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Right pane (PDF preview)
                    SizedBox(
                      width: rightWidth,
                      child: PdfViewWidget(
                        viewModel: viewModel,
                      ),
                    ),
                  ],
                );
              },
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
