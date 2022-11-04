import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/gradient.dart' as g;

part 'tpl_linear_gradient.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplLinearGradient implements g.Gradient {
  TplLinearGradient();

  String className = 'TplLinearGradient';
  TplAlignment? begin;
  TplAlignment? end;
  List<dynamic>? colors;
  List<double>? stops;
  dynamic tileMode;

  factory TplLinearGradient.fromJson(Map<String, dynamic> json) =>
      _$TplLinearGradientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplLinearGradientToJson(this);

  @override
  Gradient buildGradient(Map<String, dynamic> data) {
    return LinearGradient(
        begin: begin?.toPdf(data) ?? Alignment.centerLeft,
        end: end?.toPdf(data) ?? Alignment.centerLeft,
        colors: colors == null ? [] : getColors(colors!, data),
        stops: evaluateList(stops, data),
        tileMode: evaluateTileMode(tileMode, data) ?? TileMode.clamp);
  }
}
