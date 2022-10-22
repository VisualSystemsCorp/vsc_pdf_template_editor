import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_alignment.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAlignment {
  const TplAlignment({this.alignment = 'center'});

  final dynamic alignment;

  factory TplAlignment.fromJson(Map<String, dynamic> json) =>
      _$TplAlignmentFromJson(json);

  Map<String, dynamic> toJson() => _$TplAlignmentToJson(this);

  ws.Alignment toPdf(Map<String, dynamic> data) {
    final alignmentStr = evaluateString(alignment, data);
    switch (alignmentStr) {
      case 'topLeft':
        return ws.Alignment(-1, 1);
      case 'topCenter':
        return ws.Alignment(0, 1);
      case 'topRight':
        return ws.Alignment(1, 1);
      case 'centerLeft':
        return ws.Alignment(-1, 0);
      case 'centerRight':
        return ws.Alignment(1, 0);
      case 'bottomLeft':
        return ws.Alignment(-1, -1);
      case 'bottomCenter':
        return ws.Alignment(0, -1);
      case 'bottomRight':
        return ws.Alignment(1, -1);
      default:
        throw Exception('Invalid alignment: $alignmentStr');
    }
  }
}
