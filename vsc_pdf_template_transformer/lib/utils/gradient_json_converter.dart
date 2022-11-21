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
      switch (json['t']) {
        case 'LinearGradient':
          return TplLinearGradient.fromJson(json);
        case 'RadialGradient':
          return TplRadialGradient.fromJson(json);
      }
      throw Exception('No gradient type or unknown gradient type');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(g.Gradient? object) {
    return object?.toJson();
  }
}
