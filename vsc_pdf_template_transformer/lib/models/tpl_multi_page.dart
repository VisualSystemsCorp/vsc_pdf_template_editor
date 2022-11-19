import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/src/async_pdf_widgets/async_multi_page.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart';

part 'tpl_multi_page.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplMultiPage {
  TplMultiPage(this.children);

  String className = 'TplMultiPage';
  TplPageTheme? pageTheme;
  dynamic theme;
  TplPdfPageFormat? pageFormat;
  dynamic orientation;
  TplEdgeInsets? margin;
  dynamic clip;
  dynamic textDirection;
  dynamic maxPages;
  dynamic mainAxisAlignment;
  dynamic crossAxisAlignment;
  @WidgetJsonConverter()
  WidgetBuilder? header;
  @WidgetJsonConverter()
  WidgetBuilder? footer;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplMultiPage.fromJson(Map<String, dynamic> json) =>
      _$TplMultiPageFromJson(json);

  Map<String, dynamic> toJson() => _$TplMultiPageToJson(this);

  Future<AsyncMultiPage> toPdf(Map<String, dynamic> data) async {
    return AsyncMultiPage(
        pageTheme: await pageTheme?.toPdf(data),
        theme: await evaluateThemeData(theme, data),
        pageFormat: await pageFormat?.toPdf(data),
        orientation: await evaluatePageOrientation(orientation, data),
        margin: await margin?.toPdf(data),
        textDirection: await evaluateTextDirection(textDirection, data),
        maxPages: await evaluateInt(maxPages, data) ?? 20,
        mainAxisAlignment:
            await evaluateMainAxisAlignment(mainAxisAlignment, data) ??
                pw.MainAxisAlignment.start,
        crossAxisAlignment:
            await evaluateCrossAxisAlignment(crossAxisAlignment, data) ??
                pw.CrossAxisAlignment.start,
        header: header != null
            ? (pw.Context context) async =>
                header!.buildWidget(addPageInfoToData(context, data))
            : null,
        footer: footer != null
            ? (pw.Context context) async =>
                footer!.buildWidget(addPageInfoToData(context, data))
            : null,
        build: (pw.Context context) async {
          return children == null
              ? [pw.SizedBox()]
              : await getChildren(children!, data);
        });
  }
}
