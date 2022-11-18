import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_page.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPage {
  TplPage(this.child);

  String className = 'TplPage';
  TplPageTheme? pageTheme;
  dynamic theme;
  TplPdfPageFormat? pageFormat;
  dynamic orientation;
  TplEdgeInsets? margin;
  dynamic clip;
  dynamic textDirection;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplPage.fromJson(Map<String, dynamic> json) =>
      _$TplPageFromJson(json);

  Map<String, dynamic> toJson() => _$TplPageToJson(this);

  pw.Page toPdf(Map<String, dynamic> data) {
    return pw.Page(
      pageTheme: pageTheme?.toPdf(data),
      theme: evaluateThemeData(theme, data),
      pageFormat: pageFormat?.toPdf(data),
      orientation: evaluatePageOrientation(orientation, data),
      margin: margin?.toPdf(data),
      textDirection: evaluateTextDirection(textDirection, data),
      clip: evaluateBool(clip, data) ?? false,
      build: (pw.Context context) {
        return child?.buildWidget(addPageInfoToData(context, data)) ??
            pw.SizedBox();
      },
    );
  }
}
