import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/evaluator.dart';
import '../utils/widget_builder.dart' as wb;
import 'tpl_text_style.dart';

part 'tpl_header.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplHeader implements wb.WidgetBuilder {
  TplHeader();

  String t = 'Header';
  dynamic title;
  dynamic text;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  dynamic level;
  TplBoxDecoration? decoration;
  TplEdgeInsets? margin;
  TplEdgeInsets? padding;
  TplTextStyle? style;
  dynamic color;
  dynamic outlineStyle;

  factory TplHeader.fromJson(Map<String, dynamic> json) =>
      _$TplHeaderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplHeaderToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Header(
        title: await evaluateString(title, data),
        text: await evaluateString(text, data),
        child: await child?.buildWidget(data),
        level: await evaluateInt(level, data) ?? 1,
        decoration: await decoration?.toPdf(data),
        margin: await margin?.toPdf(data),
        padding: await padding?.toPdf(data),
        textStyle: await style?.toPdf(data),
        outlineColor: await evaluateColor(color, data),
        outlineStyle: await evaluateOutlineStyle(outlineStyle, data) ??
            PdfOutlineStyle.normal);
  }
}
