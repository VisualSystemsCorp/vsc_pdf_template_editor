import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/alignment.dart' as a;
import '../utils/gradient.dart' as g;

part 'tpl_radial_gradient.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRadialGradient implements g.Gradient {
  TplRadialGradient();

  String t = 'RadialGradient';
  @AlignmentJsonConverter()
  a.Alignment? center;
  dynamic radius;
  List<dynamic>? colors;
  List<double>? stops;
  dynamic tileMode;
  @AlignmentJsonConverter()
  a.Alignment? focal;
  dynamic focalRadius;

  factory TplRadialGradient.fromJson(Map<String, dynamic> json) =>
      _$TplRadialGradientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRadialGradientToJson(this);

  @override
  Future<Gradient> buildGradient(Map<String, dynamic> data) async {
    return RadialGradient(
      center: await center?.buildAlignment(data) ?? Alignment.center,
      radius: await evaluateDouble(radius, data) ?? 0.5,
      colors: colors == null ? [] : await getColors(colors!, data),
      stops: await evaluateList(stops, data),
      tileMode: await evaluateTileMode(tileMode, data) ?? TileMode.clamp,
      focal: await focal?.buildAlignment(data),
      focalRadius: await evaluateDouble(focalRadius, data) ?? 0,
    );
  }
}
