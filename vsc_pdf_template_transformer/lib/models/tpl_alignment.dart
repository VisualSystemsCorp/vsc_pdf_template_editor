import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/alignment.dart' as a;

part 'tpl_alignment.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAlignment extends a.Alignment {
  TplAlignment();

  String className = 'TplAlignment';
  dynamic alignment;
  dynamic x;
  dynamic y;

  factory TplAlignment.fromJson(Map<String, dynamic> json) =>
      _$TplAlignmentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAlignmentToJson(this);

  @override
  Future<ws.Alignment> buildAlignment(Map<String, dynamic> data) async {
    final alignmentStr = await evaluateString(alignment, data);
    if (alignmentStr == null) {
      return ws.Alignment(await evaluateDouble(x, data) ?? 0.0,
          await evaluateDouble(y, data) ?? 0.0);
    }

    switch (alignmentStr) {
      case 'center':
        return ws.Alignment.center;
      case 'topLeft':
        return ws.Alignment.topLeft;
      case 'topCenter':
        return ws.Alignment.topCenter;
      case 'topRight':
        return ws.Alignment.topRight;
      case 'centerLeft':
        return ws.Alignment.centerLeft;
      case 'centerRight':
        return ws.Alignment.centerRight;
      case 'bottomLeft':
        return ws.Alignment.bottomLeft;
      case 'bottomCenter':
        return ws.Alignment.bottomCenter;
      case 'bottomRight':
        return ws.Alignment.bottomRight;
      default:
        throw Exception('Invalid alignment: $alignmentStr');
    }
  }
}
