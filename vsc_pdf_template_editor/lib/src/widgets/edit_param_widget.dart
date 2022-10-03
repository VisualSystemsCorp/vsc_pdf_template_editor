import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:vsc_pdf_template_editor/src/widgets/list_item_widget_param.dart';
import '../stores/tree_store.dart';

class EditParamWidget extends StatelessWidget {
  const EditParamWidget({
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
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: SizedBox(
            width: width * 0.25,
            height: height - 50,
            child: Observer(builder: (context) {
              return viewModel.selectedNode == null ||
                      !viewModel.treeViewController!.selectedNode!.hasData
                  ? const Center(
                      child: Text(AppStrings.chooseWidget),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  AppStrings.widgetProperties,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  AppStrings.useExpression,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    viewModel.treeViewController!.selectedNode!
                                        .data.keys.length,
                                    (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: WidgetParam(
                                            index, viewModel, width))))
                          ],
                        ),
                      ),
                    );
            }),
          ),
        );
      },
    );
  }
}
