import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/image_provider_json_converter.dart';
import '../utils/image_provider.dart' as ip;
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
  @ImageProviderJsonConverter()
  ip.ImageProvider? image;
  dynamic fit;
  TplAlignment? alignment;
  dynamic dpi;

  factory TplDecorationImage.fromJson(Map<String, dynamic> json) =>
      _$TplDecorationImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplDecorationImageToJson(this);

  @override
  DecorationGraphic buildDecorationImage(Map<String, dynamic> data) {
    return DecorationImage(
        image: image!.buildImage(data),
        fit: evaluateBoxFit(fit, data) ?? BoxFit.cover,
        alignment: alignment?.toPdf(data) ?? Alignment.center,
        dpi: evaluateDouble(dpi, data));
  }
}
