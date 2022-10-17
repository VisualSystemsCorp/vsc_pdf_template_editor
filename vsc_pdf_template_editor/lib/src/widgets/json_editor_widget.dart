import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class JsonEditorWidget extends StatefulWidget {
  const JsonEditorWidget({
    Key? key,
    required this.viewModel,
    required this.data,
  }) : super(key: key);

  final TreeStore viewModel;
  final String data;

  @override
  State<StatefulWidget> createState() => _JsonEditorWidgetState();
}

class _JsonEditorWidgetState extends State<JsonEditorWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: const [
                    TextButton(
                        onPressed: null, child: Text(AppStrings.template)),
                    TextButton(onPressed: null, child: Text(AppStrings.data))
                  ])),
          body: TabBarView(
            children: [
              Container(
                color: Colors.amber.withOpacity(0.1),
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: widget.viewModel.templateController,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  autofocus: true,
                  maxLines: null,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                ),
              ),
              Container(
                color: Colors.amber.withOpacity(0.1),
                padding: const EdgeInsets.all(20),
                child: Text(widget.data),
              ),
            ],
          ),
        ),
      );
    });
  }
}
