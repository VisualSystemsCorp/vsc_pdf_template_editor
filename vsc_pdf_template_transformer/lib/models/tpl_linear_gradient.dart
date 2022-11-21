import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/alignment.dart' as a;
import '../utils/gradient.dart' as g;

part 'tpl_linear_gradient.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplLinearGradient implements g.Gradient {
  TplLinearGradient();

  String t = 'LinearGradient';
  @AlignmentJsonConverter()
  a.Alignment? begin;
  @AlignmentJsonConverter()
  a.Alignment? end;
  List<dynamic>? colors;
  List<double>? stops;
  dynamic tileMode;

  factory TplLinearGradient.fromJson(Map<String, dynamic> json) =>
      _$TplLinearGradientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplLinearGradientToJson(this);

  @override
  Future<Gradient> buildGradient(Map<String, dynamic> data) async {
    return LinearGradient(
        begin: await begin?.buildAlignment(data) ?? Alignment.centerLeft,
        end: await end?.buildAlignment(data) ?? Alignment.centerLeft,
        colors: colors == null ? [] : await getColors(colors!, data),
        stops: await evaluateList(stops, data),
        tileMode: await evaluateTileMode(tileMode, data) ?? TileMode.clamp);
  }
}
