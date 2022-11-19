import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_full_page.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFullPage implements wb.WidgetBuilder {
  TplFullPage();

  String className = 'TplFullPage';
  dynamic ignoreMargins;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplFullPage.fromJson(Map<String, dynamic> json) =>
      _$TplFullPageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFullPageToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return FullPage(
      ignoreMargins: await evaluateBool(ignoreMargins, data) ?? true,
      child: await child?.buildWidget(data),
    );
  }
}
