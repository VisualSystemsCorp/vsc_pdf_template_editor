import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme.dart';
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
  TplThemeData? theme;
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
  List<dynamic>? children;

  factory TplMultiPage.fromJson(Map<String, dynamic> json) =>
      _$TplMultiPageFromJson(json);

  Map<String, dynamic> toJson() => _$TplMultiPageToJson(this);

  pw.Page toPdf(Map<String, dynamic> data) {
    return pw.MultiPage(
        pageTheme: pageTheme?.toPdf(data),
        theme: theme?.toPdf(data),
        pageFormat: pageFormat?.toPdf(data),
        orientation: evaluatePageOrientation(orientation, data),
        margin: margin?.toPdf(data),
        textDirection: evaluateTextDirection(textDirection, data),
        maxPages: evaluateInt(maxPages, data) ?? 20,
        mainAxisAlignment: evaluateMainAxisAlignment(mainAxisAlignment, data) ??
            pw.MainAxisAlignment.start,
        crossAxisAlignment:
            evaluateCrossAxisAlignment(crossAxisAlignment, data) ??
                pw.CrossAxisAlignment.start,
        header: header != null
            ? (pw.Context context) => header!.buildWidget(data)
            : null,
        build: (pw.Context context) {
          return children == null ? [] : getChildren(children!, data);
        });
  }
}
