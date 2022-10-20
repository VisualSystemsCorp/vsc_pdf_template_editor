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
  const TplBorderRadius(
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight, {
    this.type = 'zero',
  });

  const TplBorderRadius.all(TplRadius radius)
      : this.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  TplBorderRadius.circular(double radius)
      : this.all(
          TplRadius.circular(radius),
        );

  const TplBorderRadius.vertical({
    TplRadius top = TplRadius.zero,
    TplRadius bottom = TplRadius.zero,
  }) : this.only(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  const TplBorderRadius.horizontal({
    TplRadius left = TplRadius.zero,
    TplRadius right = TplRadius.zero,
  }) : this.only(
          topLeft: left,
          topRight: right,
          bottomLeft: left,
          bottomRight: right,
        );

  const TplBorderRadius.only({
    this.topLeft = TplRadius.zero,
    this.topRight = TplRadius.zero,
    this.bottomLeft = TplRadius.zero,
    this.bottomRight = TplRadius.zero,
    this.type = 'zero',
  });

  static const TplBorderRadius zero = const TplBorderRadius.all(TplRadius.zero);

  final TplRadius? topLeft;
  final TplRadius? topRight;
  final TplRadius? bottomLeft;
  final TplRadius? bottomRight;
  final String type;

  factory TplBorderRadius.fromJson(Map<String, dynamic> json) =>
      _$TplBorderRadiusFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderRadiusToJson(this);

  static TplBorderRadius? from(ws.BorderRadius value) {
    TplBorderRadius result = TplBorderRadius.zero;
    return result;
  }

  static ws.BorderRadius to(TplBorderRadius? value) {
    ws.BorderRadius result = ws.BorderRadius.zero;
    if (value == null) return result;
    switch (value.type) {
      case 'all':
        result = ws.BorderRadius.all(ws.Radius.circular(20));
        break;
      case 'circular':
        result = ws.BorderRadius.circular(10);
        break;
      case 'vertical':
        result = ws.BorderRadius.vertical();
        break;
      case 'horizontal':
        result = ws.BorderRadius.horizontal();
        break;
    }

    return result;
  }
}
