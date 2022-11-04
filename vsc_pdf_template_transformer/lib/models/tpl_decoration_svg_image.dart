import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/decoration_graphic.dart' as dg;
import '../utils/alignment.dart' as a;

part 'tpl_decoration_svg_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDecorationSvgImage implements dg.DecorationGraphic {
  TplDecorationSvgImage();

  String className = 'TplDecorationSvgImage';
  dynamic svg;
  dynamic fit;
  @AlignmentJsonConverter()
  a.Alignment? alignment;

  factory TplDecorationSvgImage.fromJson(Map<String, dynamic> json) =>
      _$TplDecorationSvgImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplDecorationSvgImageToJson(this);

  @override
  DecorationGraphic buildDecorationImage(Map<String, dynamic> data) {
    return DecorationSvgImage(
      svg: evaluateString(svg, data) ?? '',
      fit: evaluateBoxFit(fit, data) ?? BoxFit.cover,
      alignment: alignment?.buildAlignment(data) ?? Alignment.center,
    );
  }
}
