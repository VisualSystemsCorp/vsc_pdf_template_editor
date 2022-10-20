import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
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
    this.border = const TplBoxBorder(),
    this.borderRadius = TplBorderRadius.zero,
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
        borderRadius: TplBorderRadius.zero);
    return result;
  }

  static ws.BoxDecoration to(TplBoxDecoration? value) {
    if (value == null) return ws.BoxDecoration();
    final result = ws.BoxDecoration(
        color: value.color != null ? PdfColor.fromHex(value.color!) : null,
        border: TplBoxBorder.to(value.border),
        borderRadius: TplBorderRadius.to(value.borderRadius));
    return result;
  }
}
