import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:easy_debounce/easy_debounce.dart';
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
            height: height - 50, //TODO add smart resolving
            child: Observer(builder: (context) {
              return viewModel.widgetProps.isEmpty
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
                              children: [
                                const Text(
                                  AppStrings.useExpression,
                                ),
                                Switch(
                                    value: viewModel.isExpressionOn,
                                    onChanged: (val) =>
                                        viewModel.toggleExpressionSwitch(val))
                              ],
                            ),
                            const Text(
                              AppStrings.widgetProperties,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            _Items(
                              viewModel,
                            )
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

class _Items extends StatelessWidget {
  const _Items(this.viewModel);

  final TreeStore viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            viewModel.widgetProps.keys.toList().length,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 50,
                    //width: 160,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.purple.shade500,
                        ))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.widgetProps.keys.toList()[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none, isDense: true),
                              controller: viewModel.controllers[index],
                              onChanged: (val) => EasyDebounce.debounce(
                                  '',
                                  const Duration(milliseconds: 500),
                                  () => viewModel.evaluateInput(
                                      viewModel.controllers[index].text)),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ]),
                    ),
                  ),
                )) //_widgetsProps(treeStore.widgetProps),
        );
  }
}
