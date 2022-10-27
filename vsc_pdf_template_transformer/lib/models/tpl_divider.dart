import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_divider.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDivider implements wb.WidgetBuilder {
  TplDivider();

  String className = 'TplDivider';
  dynamic height;
  dynamic thickness;
  dynamic indent;
  dynamic endIndent;
  dynamic color;
  TplBorderStyle? borderStyle;

  factory TplDivider.fromJson(Map<String, dynamic> json) =>
      _$TplDividerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplDividerToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Divider(
        height: evaluateDouble(height, data),
        thickness: evaluateDouble(thickness, data),
        indent: evaluateDouble(indent, data),
        endIndent: evaluateDouble(endIndent, data),
        color: evaluateColor(color, data),
        borderStyle: borderStyle?.toPdf(data));
  }
}
