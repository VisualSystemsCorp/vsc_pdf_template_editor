import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_side.dart';

part 'tpl_table_border.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTableBorder {
  TplTableBorder();

  TplBorderSide? top;
  TplBorderSide? bottom;
  TplBorderSide? left;
  TplBorderSide? right;
  TplBorderSide? all;
  TplBorderSide? horizontalInside;
  TplBorderSide? verticalInside;
  TplBorderSide? inside;
  TplBorderSide? outside;

  factory TplTableBorder.fromJson(Map<String, dynamic> json) =>
      _$TplTableBorderFromJson(json);

  Map<String, dynamic> toJson() => _$TplTableBorderToJson(this);

  ws.TableBorder toPdf(Map<String, dynamic> data) {
    if (all != null) {
      final border = all!.toPdf(data);
      return ws.TableBorder.all(
          color: border.color, width: border.width, style: border.style);
    }

    if (inside != null || outside != null) {
      return ws.TableBorder.symmetric(
        inside: inside?.toPdf(data) ?? ws.BorderSide.none,
        outside: outside?.toPdf(data) ?? ws.BorderSide.none,
      );
    }

    return ws.TableBorder(
      top: top?.toPdf(data) ?? ws.BorderSide.none,
      bottom: bottom?.toPdf(data) ?? ws.BorderSide.none,
      left: left?.toPdf(data) ?? ws.BorderSide.none,
      right: right?.toPdf(data) ?? ws.BorderSide.none,
      horizontalInside: horizontalInside?.toPdf(data) ?? ws.BorderSide.none,
      verticalInside: verticalInside?.toPdf(data) ?? ws.BorderSide.none,
    );
  }
}
