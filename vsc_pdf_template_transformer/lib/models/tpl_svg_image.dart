import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_svg_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplSvgImage implements wb.WidgetBuilder {
  TplSvgImage();

  String className = 'TplSvgImage';
  dynamic svg;
  dynamic fit;
  TplAlignment? alignment;
  dynamic clip;
  dynamic width;
  dynamic height;
  dynamic colorFilter;

  factory TplSvgImage.fromJson(Map<String, dynamic> json) =>
      _$TplSvgImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplSvgImageToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return SvgImage(
        svg: evaluateString(svg, data) ?? '',
        fit: evaluateBoxFit(fit, data) ?? BoxFit.contain,
        alignment: alignment?.toPdf(data) ?? Alignment.center,
        clip: evaluateBool(clip, data) ?? true,
        width: evaluateDouble(width, data),
        height: evaluateDouble(height, data),
        colorFilter: evaluateColor(colorFilter, data));
  }
}
