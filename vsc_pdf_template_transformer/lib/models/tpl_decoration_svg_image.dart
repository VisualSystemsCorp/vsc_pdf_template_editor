import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_decoration_svg_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDecorationSvgImage {
  TplDecorationSvgImage();

  String className = 'TplDecorationSvgImage';
  dynamic svg;
  dynamic fit;
  TplAlignment? alignment;

  factory TplDecorationSvgImage.fromJson(Map<String, dynamic> json) =>
      _$TplDecorationSvgImageFromJson(json);

  Map<String, dynamic> toJson() => _$TplDecorationSvgImageToJson(this);

  DecorationGraphic buildImage(Map<String, dynamic> data) {
    return DecorationSvgImage(
      svg: evaluateString(svg, data) ?? '',
      fit: evaluateBoxFit(fit, data) ?? BoxFit.cover,
      alignment: alignment?.toPdf(data) ?? Alignment.center,
    );
  }
}
