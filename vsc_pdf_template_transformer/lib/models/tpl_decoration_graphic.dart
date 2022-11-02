import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_svg_image.dart';

part 'tpl_decoration_graphic.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDecorationGraphic {
  TplDecorationGraphic();

  Map<String, dynamic>? decorationData;

  factory TplDecorationGraphic.fromJson(Map<String, dynamic> json) =>
      _$TplDecorationGraphicFromJson(json);

  Map<String, dynamic> toJson() => _$TplDecorationGraphicToJson(this);

  DecorationGraphic buildDecorationImage(Map<String, dynamic> data) {
    if (decorationData != null){
      switch (decorationData!['className']) {
        case 'TplDecorationImage':
          return TplDecorationImage.fromJson(decorationData!).buildImage(data);
        case 'TplDecorationSvgImage':
          return TplDecorationSvgImage.fromJson(decorationData!).buildImage(data);
      }
    }
    throw Exception('No decoration className or unknown decoration className');
  }
}
