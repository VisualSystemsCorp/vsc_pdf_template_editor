import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;

part 'tpl_border_side.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBorderSide {
  TplBorderSide({
    required this.width,
  });

  final double width;

  factory TplBorderSide.fromJson(Map<String, dynamic> json) =>
      _$TplBorderSideFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderSideToJson(this);

  static TplBorderSide? from(ws.BorderSide value) {
    TplBorderSide result = TplBorderSide(width: value.width);
    return result;
  }

  static ws.BorderSide to(TplBorderSide? value) {
    ws.BorderSide result = ws.BorderSide();
    if (value == null) return result;
    return result;
  }
}
