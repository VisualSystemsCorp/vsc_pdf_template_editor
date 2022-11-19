import 'dart:math' as math;

import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

import '../utils/widget_json_converter.dart';

part 'tpl_watermark.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplWatermark implements wb.WidgetBuilder {
  TplWatermark();

  String className = 'TplWatermark';
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  dynamic fit;
  dynamic angle;
  dynamic text;
  TplTextStyle? style;

  factory TplWatermark.fromJson(Map<String, dynamic> json) =>
      _$TplWatermarkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplWatermarkToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    final textStr = await evaluateString(text, data);
    if (textStr == null) {
      return Watermark(
          child: await child?.buildWidget(data) ?? SizedBox(),
          fit: evaluateBoxFit(fit, data) ?? BoxFit.contain,
          angle: await evaluateDouble(angle, data) ?? 0);
    }
    return Watermark.text(textStr,
        style: style?.toPdf(data),
        fit: evaluateBoxFit(fit, data) ?? BoxFit.contain,
        angle: await evaluateDouble(angle, data) ?? math.pi / 4);
  }
}
