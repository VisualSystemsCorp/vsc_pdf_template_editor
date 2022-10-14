import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_side.dart';

part 'tpl_box_border.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBoxBorder {
  TplBoxBorder({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  TplBorderSide? top;
  TplBorderSide? right;
  TplBorderSide? bottom;
  TplBorderSide? left;

  factory TplBoxBorder.fromJson(Map<String, dynamic> json) =>
      _$TplBoxBorderFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxBorderToJson(this);

  static TplBoxBorder? from(ws.BoxBorder value) {
    TplBoxBorder result = TplBoxBorder();

    return result;
  }

  static ws.BoxBorder to(TplBoxBorder? value) {
    ws.BoxBorder result = ws.Border();
    if (value == null) return result;
    return result;
  }
}
