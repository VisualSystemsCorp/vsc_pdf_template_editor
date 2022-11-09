import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_fixed_axis.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFixedAxis {
  TplFixedAxis();

  List<dynamic>? values;
  TplTextStyle? textStyle;
  dynamic margin;
  dynamic marginStart;
  dynamic marginEnd;
  dynamic color;
  dynamic width;
  dynamic divisions;
  dynamic divisionsWidth;
  dynamic divisionsColor;
  dynamic divisionsDashed;
  dynamic ticks;
  dynamic axisTick;
  dynamic angle;

  factory TplFixedAxis.fromJson(Map<String, dynamic> json) =>
      _$TplFixedAxisFromJson(json);

  Map<String, dynamic> toJson() => _$TplFixedAxisToJson(this);

  FixedAxis toPdf(Map<String, dynamic> data) {
    return FixedAxis(evaluateList(values, data)!,
        textStyle: textStyle?.toPdf(data),
        margin: evaluateDouble(margin, data),
        marginStart: evaluateDouble(marginStart, data),
        marginEnd: evaluateDouble(marginEnd, data),
        color: evaluateColor(color, data),
        width: evaluateDouble(width, data),
        divisions: evaluateBool(divisions, data),
        divisionsWidth: evaluateDouble(divisionsWidth, data),
        divisionsColor: evaluateColor(divisionsColor, data),
        divisionsDashed: evaluateBool(divisionsDashed, data),
        ticks: evaluateBool(ticks, data),
        axisTick: evaluateBool(axisTick, data),
        angle: evaluateDouble(angle, data) ?? 0);
  }
}
