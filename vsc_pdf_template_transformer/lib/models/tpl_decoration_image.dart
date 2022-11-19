import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/alignment.dart' as a;
import '../utils/decoration_graphic.dart' as dg;

part 'tpl_decoration_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDecorationImage implements dg.DecorationGraphic {
  TplDecorationImage();

  String className = 'TplDecorationImage';
  dynamic image;
  dynamic fit;
  @AlignmentJsonConverter()
  a.Alignment? alignment;
  dynamic dpi;

  factory TplDecorationImage.fromJson(Map<String, dynamic> json) =>
      _$TplDecorationImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplDecorationImageToJson(this);

  @override
  DecorationGraphic buildDecorationImage(Map<String, dynamic> data) {
    final imageProvider = evaluateImageProvider(image, data);
    if (imageProvider == null) {
      throw Exception('"image" attribute is required');
    }

    return DecorationImage(
        image: imageProvider,
        fit: evaluateBoxFit(fit, data) ?? BoxFit.cover,
        alignment: alignment?.buildAlignment(data) ?? Alignment.center,
        dpi: await evaluateDouble(dpi, data));
  }
}
