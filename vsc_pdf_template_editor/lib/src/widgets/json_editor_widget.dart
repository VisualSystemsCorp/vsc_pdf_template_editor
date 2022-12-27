import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/view_model.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class JsonEditorWidget extends StatefulWidget {
  const JsonEditorWidget({
    Key? key,
    required this.viewModel,
    required this.data,
    this.codeFieldTextStyle,
  }) : super(key: key);

  final ViewModel viewModel;
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
    return Observer(
      builder: (context) {
        return CodeTheme(
          data: const CodeThemeData(styles: atomOneDarkReasonableTheme),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).colorScheme.onSurface,
                tabs: const [
                  Tab(text: AppStrings.template),
                  Tab(text: AppStrings.data),
                ],
              ),
              Expanded(
                child: Column(
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
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
