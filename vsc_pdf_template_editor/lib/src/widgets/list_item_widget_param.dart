import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';

class WidgetParam extends StatelessWidget {
  const WidgetParam(this.index, this.viewModel, this.width, {super.key});

  final int index;
  final TreeStore viewModel;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border(
                bottom: BorderSide(
              color: Colors.purple.shade500,
            ))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.selectedNodeProps[index],
                      style: const TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: width * 0.15,
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none, isDense: true),
                        controller: viewModel.controllers[index],
                        onChanged: (val) => EasyDebounce.debounce(
                            '',
                            const Duration(milliseconds: 500),
                            () => viewModel.onInputChanged(
                                viewModel.controllers[index].text, index)),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ]),
              Switch(
                  value: viewModel.isExpressionOn![index],
                  onChanged: (val) =>
                      viewModel.toggleExpressionSwitch(index, val)),
            ],
          ),
        ),
      );
    });
  }
}
