import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_image_provider.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_decoration_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDecorationImage {
  TplDecorationImage();

  String className = 'TplDecorationImage';
  TplImageProvider? provider;
  dynamic fit;
  TplAlignment? alignment;
  dynamic dpi;

  factory TplDecorationImage.fromJson(Map<String, dynamic> json) =>
      _$TplDecorationImageFromJson(json);

  Map<String, dynamic> toJson() => _$TplDecorationImageToJson(this);

  DecorationGraphic buildImage(Map<String, dynamic> data) {
    return DecorationImage(
        image: provider!.buildImage(data),
        fit: evaluateBoxFit(fit, data) ?? BoxFit.cover,
        alignment: alignment?.toPdf(data) ?? Alignment.center,
        dpi: evaluateDouble(dpi, data));
  }
}
