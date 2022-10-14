import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_radius.dart';

part 'tpl_border_radius.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBorderRadius {
  TplBorderRadius({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  TplRadius? topLeft;
  TplRadius? topRight;
  TplRadius? bottomLeft;
  TplRadius? bottomRight;

  factory TplBorderRadius.fromJson(Map<String, dynamic> json) =>
      _$TplBorderRadiusFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderRadiusToJson(this);

  static TplBorderRadius? from(ws.BorderRadius value) {
    TplBorderRadius result = TplBorderRadius();
    return result;
  }

  static ws.BorderRadius to(TplBorderRadius? value) {
    ws.BorderRadius result = ws.BorderRadius.zero;
    if (value == null) return result;
    return result;
  }
}
