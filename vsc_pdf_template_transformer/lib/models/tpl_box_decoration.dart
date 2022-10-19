import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_border.dart';

part 'tpl_box_decoration.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBoxDecoration {
  const TplBoxDecoration({
    this.color,
    this.border,
    this.borderRadius,
  });

  @JsonKey(defaultValue: null)
  final String? color;
  final TplBoxBorder? border;
  final TplBorderRadius? borderRadius;

  factory TplBoxDecoration.fromJson(Map<String, dynamic> json) =>
      _$TplBoxDecorationFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxDecorationToJson(this);

  static TplBoxDecoration? from(ws.BoxDecoration value) {
    TplBoxDecoration result = TplBoxDecoration(
        color: value.color.toString(),
        border: TplBoxBorder(),
        borderRadius: TplBorderRadius());
    return result;
  }

  static ws.BoxDecoration to(TplBoxDecoration? value) {
    ws.BoxDecoration result = ws.BoxDecoration();
    if (value == null) return result;
    return result;
  }
}
