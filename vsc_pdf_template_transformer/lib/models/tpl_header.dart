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

  String className = 'TplHeader';
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
  Widget buildWidget(Map<String, dynamic> data) {
    return Header(
        title: evaluateString(title, data),
        text: evaluateString(text, data),
        child: child?.buildWidget(data),
        level: evaluateInt(level, data) ?? 1,
        decoration: decoration?.toPdf(data),
        margin: margin?.toPdf(data),
        padding: padding?.toPdf(data),
        textStyle: style?.toPdf(data),
        outlineColor: evaluateColor(color, data),
        outlineStyle:
            evaluateOutlineStyle(outlineStyle, data) ?? PdfOutlineStyle.normal);
  }
}
