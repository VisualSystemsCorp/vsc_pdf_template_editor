import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_graphic.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

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
  TplDecorationGraphic? image;

  factory TplBoxDecoration.fromJson(Map<String, dynamic> json) =>
      _$TplBoxDecorationFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxDecorationToJson(this);

  ws.BoxDecoration toPdf(Map<String, dynamic> data) {
    final result = ws.BoxDecoration(
        color: evaluateColor(color, data),
        border: border?.toPdf(data),
        borderRadius: borderRadius?.toPdf(data),
        image: image?.buildDecorationImage(data));
    return result;
  }
}
