import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:code_text_field/code_text_field.dart';

class JsonEditorWidget extends StatefulWidget {
  const JsonEditorWidget({
    Key? key,
    required this.viewModel,
    required this.data,
    this.codeFieldTextStyle,
  }) : super(key: key);

  final TreeStore viewModel;
  final String data;
  final TextStyle? codeFieldTextStyle;

  @override
  State<StatefulWidget> createState() => _JsonEditorWidgetState();
}

class _JsonEditorWidgetState extends State<JsonEditorWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.viewModel.activeTab = _tabController.index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).primaryColor,
                tabs: const [
                  TextButton(onPressed: null, child: Text(AppStrings.template)),
                  TextButton(onPressed: null, child: Text(AppStrings.data))
                ])),
        body: Column(
          children: [
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: CodeField(
                      controller: widget.viewModel.templateController,
                      expands: true,
                      textStyle: widget.codeFieldTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CodeField(
                        controller: widget.viewModel.dataController,
                        expands: true,
                        textStyle: widget.codeFieldTextStyle,
                      )),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.2,
                child: SingleChildScrollView(
                    child: Text(widget.viewModel.buildErrorText)))
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
