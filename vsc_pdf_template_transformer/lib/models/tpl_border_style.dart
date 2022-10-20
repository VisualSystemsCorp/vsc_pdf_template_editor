import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import "package:pdf/widgets.dart" as ws;

part 'tpl_border_style.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBorderStyle {
  const TplBorderStyle({
    this.paint = true,
    this.pattern,
    this.phase = 0,
  });

  final bool paint;
  final List<num>? pattern;
  final int phase;

  factory TplBorderStyle.fromJson(Map<String, dynamic> json) =>
      _$TplBorderStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderStyleToJson(this);

  static TplBorderStyle? from(ws.BorderStyle value) {
    TplBorderStyle result = TplBorderStyle();
    return result;
  }

  static ws.BorderStyle to(TplBorderStyle? value) {
    if (value == null) return ws.BorderStyle();
    final result = ws.BorderStyle(
        paint: value.paint, pattern: value.pattern, phase: value.phase);
    return result;
  }
}
