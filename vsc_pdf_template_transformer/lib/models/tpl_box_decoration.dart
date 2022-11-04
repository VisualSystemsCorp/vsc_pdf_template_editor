import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_border.dart';
import 'package:vsc_pdf_template_transformer/utils/decoration_graphic_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/gradient_json_converter.dart';
import '../utils/decoration_graphic.dart' as dg;
import '../utils/gradient.dart' as g;

part 'tpl_box_decoration.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBoxDecoration {
  TplBoxDecoration();

  dynamic color;
  TplBoxBorder? border;
  TplBorderRadius? borderRadius;
  @GradientJsonConverter()
  g.Gradient? gradient;
  @DecorationGraphicJsonConverter()
  dg.DecorationGraphic? image;

  factory TplBoxDecoration.fromJson(Map<String, dynamic> json) =>
      _$TplBoxDecorationFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxDecorationToJson(this);

  ws.BoxDecoration toPdf(Map<String, dynamic> data) {
    final result = ws.BoxDecoration(
        color: evaluateColor(color, data),
        border: border?.toPdf(data),
        borderRadius: borderRadius?.toPdf(data),
        gradient: gradient?.buildGradient(data),
        image: image?.buildDecorationImage(data));
    return result;
  }
}
