import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_spacer.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplSpacer implements wb.WidgetBuilder {
  TplSpacer();

  String t = 'Spacer';
  dynamic flex;

  factory TplSpacer.fromJson(Map<String, dynamic> json) =>
      _$TplSpacerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplSpacerToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Spacer(flex: await evaluateInt(flex, data) ?? 1);
  }
}
