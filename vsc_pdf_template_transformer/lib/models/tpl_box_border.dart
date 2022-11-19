import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_side.dart';

part 'tpl_box_border.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBoxBorder {
  TplBoxBorder();

  TplBorderSide? top;
  TplBorderSide? bottom;
  TplBorderSide? left;
  TplBorderSide? right;
  TplBorderSide? all;
  TplBorderSide? vertical;
  TplBorderSide? horizontal;

  factory TplBoxBorder.fromJson(Map<String, dynamic> json) =>
      _$TplBoxBorderFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxBorderToJson(this);

  Future<ws.BoxBorder> toPdf(Map<String, dynamic> data) async {
    if (all != null) {
      final border = await all!.toPdf(data);
      return ws.Border.all(
          color: border.color, width: border.width, style: border.style);
    }

    if (vertical != null || horizontal != null) {
      return ws.Border.symmetric(
        vertical: await vertical?.toPdf(data) ?? ws.BorderSide.none,
        horizontal: await horizontal?.toPdf(data) ?? ws.BorderSide.none,
      );
    }

    return ws.Border(
      top: await top?.toPdf(data) ?? ws.BorderSide.none,
      bottom: await bottom?.toPdf(data) ?? ws.BorderSide.none,
      left: await left?.toPdf(data) ?? ws.BorderSide.none,
      right: await right?.toPdf(data) ?? ws.BorderSide.none,
    );
  }
}
