import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:easy_debounce/easy_debounce.dart';

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
                      onChanged: (val) => EasyDebounce.debounce(
                          '',
                          const Duration(milliseconds: 500),
                          () => widget.viewModel.onInputChanged()),
                    ),
                  ),
                  Container(
                    color: Colors.amber.withOpacity(0.1),
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      color: Colors.amber.withOpacity(0.1),
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: widget.viewModel.dataController,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        autofocus: true,
                        maxLines: null,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        onChanged: (val) => EasyDebounce.debounce(
                            '',
                            const Duration(milliseconds: 500),
                            () => widget.viewModel.onDataChanged()),
                      ),
                    ),
                  ),
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
