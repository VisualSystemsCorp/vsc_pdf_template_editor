import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_svg_image.dart';

import '../utils/decoration_graphic.dart' as dg;

class DecorationGraphicJsonConverter
    extends JsonConverter<dg.DecorationGraphic?, Map<String, dynamic>?> {
  const DecorationGraphicJsonConverter();

  @override
  dg.DecorationGraphic? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['t']) {
        case 'DecorationImage':
          return TplDecorationImage.fromJson(json);
        case 'DecorationSvgImage':
          return TplDecorationSvgImage.fromJson(json);
      }
      throw Exception(
          'No decoration type name or unknown decoration type name');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(dg.DecorationGraphic? object) {
    return object?.toJson();
  }
}
