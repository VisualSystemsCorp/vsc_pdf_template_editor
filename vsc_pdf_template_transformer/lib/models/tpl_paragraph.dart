import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_paragraph.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplParagraph implements wb.WidgetBuilder {
  TplParagraph();

  String t = 'Paragraph';
  dynamic text;
  dynamic textAlign;
  TplTextStyle? style;
  TplEdgeInsets? margin;
  TplEdgeInsets? padding;

  factory TplParagraph.fromJson(Map<String, dynamic> json) =>
      _$TplParagraphFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplParagraphToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Paragraph(
        text: await evaluateString(text, data),
        textAlign:
            await evaluateTextAlign(textAlign, data) ?? TextAlign.justify,
        style: await style?.toPdf(data),
        margin: await margin?.toPdf(data) ??
            EdgeInsets.only(bottom: 5.0 * PdfPageFormat.mm),
        padding: await padding?.toPdf(data));
  }
}
