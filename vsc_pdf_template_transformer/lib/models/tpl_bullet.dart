import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_bullet.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBullet implements wb.WidgetBuilder {
  TplBullet();

  String className = 'TplBullet';

  dynamic text;
  dynamic textAlign;
  TplTextStyle? style;
  TplEdgeInsets? margin;
  TplEdgeInsets? padding;
  TplEdgeInsets? bulletMargin;
  dynamic bulletSize;
  dynamic bulletShape;
  dynamic bulletColor;

  factory TplBullet.fromJson(Map<String, dynamic> json) =>
      _$TplBulletFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplBulletToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Bullet(
        text: await evaluateString(text, data),
        textAlign: evaluateTextAlign(textAlign, data) ?? TextAlign.left,
        style: style?.toPdf(data),
        margin: margin?.toPdf(data) ??
            EdgeInsets.only(bottom: 2.0 * PdfPageFormat.mm),
        padding: padding?.toPdf(data),
        bulletMargin: bulletMargin?.toPdf(data) ??
            EdgeInsets.only(
              top: 1.5 * PdfPageFormat.mm,
              left: 5.0 * PdfPageFormat.mm,
              right: 2.0 * PdfPageFormat.mm,
            ),
        bulletSize: await evaluateDouble(bulletSize, data) ?? 2.0 * PdfPageFormat.mm,
        bulletShape: evaluateBoxShape(bulletShape, data) ?? BoxShape.circle,
        bulletColor: await evaluateColor(bulletColor, data) ?? PdfColors.black);
  }
}
