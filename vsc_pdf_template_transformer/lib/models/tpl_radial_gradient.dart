import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/gradient.dart' as g;

part 'tpl_radial_gradient.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRadialGradient implements g.Gradient {
  TplRadialGradient();

  String className = 'TplRadialGradient';
  TplAlignment? center;
  dynamic radius;
  List<dynamic>? colors;
  List<double>? stops;
  dynamic tileMode;
  TplAlignment? focal;
  dynamic focalRadius;

  factory TplRadialGradient.fromJson(Map<String, dynamic> json) =>
      _$TplRadialGradientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRadialGradientToJson(this);

  @override
  Gradient buildGradient(Map<String, dynamic> data) {
    return RadialGradient(
      center: center?.toPdf(data) ?? Alignment.center,
      radius: evaluateDouble(radius, data) ?? 0.5,
      colors: colors == null ? [] : getColors(colors!, data),
      stops: evaluateList(stops, data),
      tileMode: evaluateTileMode(tileMode, data) ?? TileMode.clamp,
      focal: focal?.toPdf(data),
      focalRadius: evaluateDouble(focalRadius, data) ?? 0,
    );
  }
}
