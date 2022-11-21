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

  Future<ws.TableBorder> toPdf(Map<String, dynamic> data) async {
    if (all != null) {
      final border = await all!.toPdf(data);
      return ws.TableBorder.all(
          color: border.color, width: border.width, style: border.style);
    }

    if (inside != null || outside != null) {
      return ws.TableBorder.symmetric(
        inside: await inside?.toPdf(data) ?? ws.BorderSide.none,
        outside: await outside?.toPdf(data) ?? ws.BorderSide.none,
      );
    }

    return ws.TableBorder(
      top: await top?.toPdf(data) ?? ws.BorderSide.none,
      bottom: await bottom?.toPdf(data) ?? ws.BorderSide.none,
      left: await left?.toPdf(data) ?? ws.BorderSide.none,
      right: await right?.toPdf(data) ?? ws.BorderSide.none,
      horizontalInside:
          await horizontalInside?.toPdf(data) ?? ws.BorderSide.none,
      verticalInside: await verticalInside?.toPdf(data) ?? ws.BorderSide.none,
    );
  }
}
