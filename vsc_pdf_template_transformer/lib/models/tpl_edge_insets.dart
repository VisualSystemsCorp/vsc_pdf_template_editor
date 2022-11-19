import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_edge_insets.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplEdgeInsets {
  TplEdgeInsets();

  dynamic left;
  dynamic top;
  dynamic right;
  dynamic bottom;
  dynamic all;
  dynamic vertical;
  dynamic horizontal;

  factory TplEdgeInsets.fromJson(Map<String, dynamic> json) =>
      _$TplEdgeInsetsFromJson(json);

  Map<String, dynamic> toJson() => _$TplEdgeInsetsToJson(this);

  ws.EdgeInsets toPdf(Map<String, dynamic> data) {
    if (all != null) {
      return ws.EdgeInsets.all(await evaluateDouble(all, data) ?? 0);
    }

    if (vertical != null || horizontal != null) {
      return ws.EdgeInsets.symmetric(
        vertical: await evaluateDouble(vertical, data) ?? 0,
        horizontal: await evaluateDouble(horizontal, data) ?? 0,
      );
    }

    return ws.EdgeInsets.fromLTRB(
      await evaluateDouble(left, data) ?? 0,
      await evaluateDouble(top, data) ?? 0,
      await evaluateDouble(right, data) ?? 0,
      await evaluateDouble(bottom, data) ?? 0,
    );
  }
}
