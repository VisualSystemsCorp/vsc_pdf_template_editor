import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import "package:pdf/widgets.dart" as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';

part 'tpl_border_side.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBorderSide {
  const TplBorderSide({
    this.width = 1.0,
    this.color = '000000',
    this.style = const TplBorderStyle(),
  });

  final double width;
  final String color;
  final TplBorderStyle style;

  factory TplBorderSide.fromJson(Map<String, dynamic> json) =>
      _$TplBorderSideFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderSideToJson(this);

  static TplBorderSide? from(ws.BorderSide value) {
    TplBorderSide result = TplBorderSide(width: value.width, color: '000000');
    return result;
  }

  static ws.BorderSide to(TplBorderSide? value) {
    if (value == null) return ws.BorderSide();
    final result = ws.BorderSide(
        width: value.width,
        color: PdfColor.fromHex(value.color),
        style: TplBorderStyle.to(value.style));
    return result;
  }
}
