import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/src/async_pdf_widgets/async_page.dart';
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

  Future<AsyncPage> toPdf(Map<String, dynamic> data) async {
    return AsyncPage(
      pageTheme: await pageTheme?.toPdf(data),
      theme: await evaluateThemeData(theme, data),
      pageFormat: await pageFormat?.toPdf(data),
      orientation: await evaluatePageOrientation(orientation, data),
      margin: await margin?.toPdf(data),
      textDirection: await evaluateTextDirection(textDirection, data),
      clip: await evaluateBool(clip, data) ?? false,
      build: (pw.Context context) async {
        return await child?.buildWidget(addPageInfoToData(context, data)) ??
            pw.SizedBox();
      },
    );
  }
}
