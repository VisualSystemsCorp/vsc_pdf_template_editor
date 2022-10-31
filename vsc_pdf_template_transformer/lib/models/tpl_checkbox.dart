import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_checkbox.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplCheckbox implements wb.WidgetBuilder {
  TplCheckbox();

  String className = 'TplCheckbox';
  dynamic value;
  dynamic tristate;
  dynamic activeColor;
  dynamic checkColor;
  dynamic name;
  dynamic width;
  dynamic height;
  TplBoxDecoration? decoration;

  factory TplCheckbox.fromJson(Map<String, dynamic> json) =>
      _$TplCheckboxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplCheckboxToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Checkbox(
        value: evaluateBool(value, data) ?? false,
        tristate: evaluateBool(tristate, data) ?? false,
        activeColor: evaluateColor(activeColor, data) ?? PdfColors.blue,
        checkColor: evaluateColor(checkColor, data) ?? PdfColors.white,
        width: evaluateDouble(width, data) ?? 13,
        height: evaluateDouble(width, data) ?? 13,
        name: evaluateString(name, data) ?? '',
        decoration: decoration?.toPdf(data));
  }
}
