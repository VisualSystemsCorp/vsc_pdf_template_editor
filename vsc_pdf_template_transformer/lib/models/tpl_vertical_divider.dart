import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_vertical_divider.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplVerticalDivider implements wb.WidgetBuilder {
  TplVerticalDivider();

  String className = 'TplVerticalDivider';
  dynamic width;
  dynamic thickness;
  dynamic indent;
  dynamic endIndent;
  dynamic color;
  TplBorderStyle? borderStyle;

  factory TplVerticalDivider.fromJson(Map<String, dynamic> json) =>
      _$TplVerticalDividerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplVerticalDividerToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return VerticalDivider(
        width: evaluateDouble(width, data),
        thickness: evaluateDouble(thickness, data),
        indent: evaluateDouble(indent, data),
        endIndent: evaluateDouble(endIndent, data),
        color: evaluateColor(color, data),
        borderStyle: borderStyle?.toPdf(data));
  }
}
