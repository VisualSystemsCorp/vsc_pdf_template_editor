import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;

part 'tpl_radius.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRadius {
  const TplRadius({this.x = 0, this.y = 0, this.type = 'zero'});

  const TplRadius.circular(double radius) : this.elliptical(radius, radius);

  const TplRadius.elliptical(this.x, this.y, {this.type = 'elliptical'});

  final double x;

  final double y;

  final String type;

  static const TplRadius zero = TplRadius.circular(0.0);

  factory TplRadius.fromJson(Map<String, dynamic> json) =>
      _$TplRadiusFromJson(json);

  Map<String, dynamic> toJson() => _$TplRadiusToJson(this);

  static TplRadius? from(ws.Radius value) {
    TplRadius result = TplRadius.zero;
    return result;
  }

  static ws.Radius to(TplRadius? value) {
    ws.Radius result = ws.Radius.zero;
    if (value == null) return result;
    switch (value.type) {
      case 'elliptical':
        result = ws.Radius.elliptical(value.x, value.y);
        break;
      case 'circular':
        result = ws.Radius.circular(value.x);
        break;
    }
    return result;
  }
}
