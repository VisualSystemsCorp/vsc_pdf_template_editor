import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_text_decoration.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTextDecoration {
  const TplTextDecoration({this.decoration = 'none'});

  final dynamic decoration;

  factory TplTextDecoration.fromJson(Map<String, dynamic> json) =>
      _$TplTextDecorationFromJson(json);

  Map<String, dynamic> toJson() => _$TplTextDecorationToJson(this);

  Future<ws.TextDecoration> toPdf(Map<String, dynamic> data) async {
    final decorationStr = await evaluateString(decoration, data);
    switch (decoration) {
      case 'none':
        return ws.TextDecoration.none;
      case 'underline':
        return ws.TextDecoration.underline;
      case 'overline':
        return ws.TextDecoration.overline;
      case 'lineThrough':
        return ws.TextDecoration.lineThrough;
      default:
        throw Exception('Invalid text decoration: $decorationStr');
    }
  }
}
