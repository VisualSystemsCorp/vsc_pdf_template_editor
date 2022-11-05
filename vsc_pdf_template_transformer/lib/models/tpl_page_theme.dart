import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_page_theme.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPageTheme {
  TplPageTheme();

  String className = 'TplPageTheme';
  dynamic pageFormat;
  dynamic orientation;
  TplEdgeInsets? margin;
  dynamic clip;
  dynamic textDirection;
  TplThemeData? theme;

  @WidgetJsonConverter()
  factory TplPageTheme.fromJson(Map<String, dynamic> json) =>
      _$TplPageThemeFromJson(json);

  Map<String, dynamic> toJson() => _$TplPageThemeToJson(this);

  pw.PageTheme toPdf(Map<String, dynamic> data) {
    return pw.PageTheme(
        pageFormat: evaluatePageFormat(pageFormat, data),
        orientation: evaluatePageOrientation(orientation, data),
        margin: margin?.toPdf(data),
        textDirection: evaluateTextDirection(textDirection, data),
        clip: evaluateBool(clip, data) ?? false,
        theme: theme?.toPdf(data));
  }
}
