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
  const TplBoxBorder({
    this.top = const TplBorderSide(),
    this.bottom = const TplBorderSide(),
    this.left = const TplBorderSide(),
    this.right = const TplBorderSide(),
    this.type = 'all',
  });

  final TplBorderSide? top;
  final TplBorderSide? bottom;
  final TplBorderSide? left;
  final TplBorderSide? right;
  final String type;

  factory TplBoxBorder.fromJson(Map<String, dynamic> json) =>
      _$TplBoxBorderFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxBorderToJson(this);

  static TplBoxBorder? from(ws.BoxBorder value) {
    TplBoxBorder result = TplBoxBorder();

    return result;
  }

  static ws.BoxBorder to(TplBoxBorder? value) {
    if (value == null) return ws.Border();
    ws.Border result = ws.Border.all();
    switch (value.type) {
      case 'symmetric':
        result = ws.Border.symmetric();
        break;
      case 'fromBorderSide':
        result = ws.Border.fromBorderSide(TplBorderSide.to(value.right));
        break;
    }
    return result;
  }
}
