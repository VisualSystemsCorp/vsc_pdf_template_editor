import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;

part 'tpl_alignment.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAlignment {
  const TplAlignment({this.alignment = 'center'});

  final String alignment;

  factory TplAlignment.fromJson(Map<String, dynamic> json) =>
      _$TplAlignmentFromJson(json);

  Map<String, dynamic> toJson() => _$TplAlignmentToJson(this);

  static TplAlignment? from(ws.EdgeInsets value) {
    final result = TplAlignment();
    return result;
  }

  static ws.Alignment to(TplAlignment? value) {
    if (value == null) return ws.Alignment(0, 0);
    ws.Alignment result = ws.Alignment(0, 0);
    switch (value.alignment) {
      case 'topLeft':
        result = ws.Alignment(-1, 1);
        break;
      case 'topCenter':
        result = ws.Alignment(0, 1);
        break;
      case 'topRight':
        result = ws.Alignment(1, 1);
        break;
      case 'centerLeft':
        result = ws.Alignment(-1, 0);
        break;
      case 'centerRight':
        result = ws.Alignment(1, 0);
        break;
      case 'bottomLeft':
        result = ws.Alignment(-1, -1);
        break;
      case 'bottomCenter':
        result = ws.Alignment(0, -1);
        break;
      case 'bottomRight':
        result = ws.Alignment(1, -1);
        break;
    }

    return result;
  }
}
