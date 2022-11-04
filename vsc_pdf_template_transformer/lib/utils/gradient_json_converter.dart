import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_linear_gradient.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radial_gradient.dart';
import '../utils/gradient.dart' as g;

class GradientJsonConverter
    extends JsonConverter<g.Gradient?, Map<String, dynamic>?> {
  const GradientJsonConverter();

  @override
  g.Gradient? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['className']) {
        case 'TplLinearGradient':
          return TplLinearGradient.fromJson(json);
        case 'TplRadialGradient':
          return TplRadialGradient.fromJson(json);
      }
      throw Exception(
          'No gradient className or unknown gradient className');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(g.Gradient? object) {
    return object?.toJson();
  }
}
