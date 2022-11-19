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
        margin: await evaluateDouble(margin, data),
        marginStart: await evaluateDouble(marginStart, data),
        marginEnd: await evaluateDouble(marginEnd, data),
        color: await evaluateColor(color, data),
        width: await evaluateDouble(width, data),
        divisions: await evaluateBool(divisions, data),
        divisionsWidth: await evaluateDouble(divisionsWidth, data),
        divisionsColor: await evaluateColor(divisionsColor, data),
        divisionsDashed: await evaluateBool(divisionsDashed, data),
        ticks: await evaluateBool(ticks, data),
        axisTick: await evaluateBool(axisTick, data),
        angle: await evaluateDouble(angle, data) ?? 0);
  }
}
