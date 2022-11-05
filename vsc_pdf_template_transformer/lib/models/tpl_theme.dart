import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_icon_theme_data.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_theme.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplThemeData {
  TplThemeData();

  String className = 'TplThemeData';
  TplTextStyle? defaultTextStyle;
  TplTextStyle? paragraphStyle;
  TplTextStyle? header0;
  TplTextStyle? header1;
  TplTextStyle? header2;
  TplTextStyle? header3;
  TplTextStyle? header4;
  TplTextStyle? header5;
  TplTextStyle? bulletStyle;
  TplTextStyle? tableHeader;
  TplTextStyle? tableCell;
  @JsonKey(defaultValue: true)
  dynamic softWrap = true;
  dynamic textAlign;
  @JsonKey(defaultValue: 1)
  dynamic maxLines;
  dynamic overflow;
  TplIconThemeData? iconTheme;

  @WidgetJsonConverter()
  factory TplThemeData.fromJson(Map<String, dynamic> json) =>
      _$TplThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$TplThemeDataToJson(this);

  pw.ThemeData toPdf(Map<String, dynamic> data) {
    return pw.ThemeData(
        defaultTextStyle: defaultTextStyle?.toPdf(data),
        paragraphStyle: paragraphStyle?.toPdf(data),
        header0: header0?.toPdf(data),
        header1: header1?.toPdf(data),
        header2: header2?.toPdf(data),
        header3: header3?.toPdf(data),
        header4: header4?.toPdf(data),
        header5: header5?.toPdf(data),
        bulletStyle: bulletStyle?.toPdf(data),
        tableHeader: tableHeader?.toPdf(data),
        tableCell: tableCell?.toPdf(data),
        softWrap: evaluateBool(softWrap, data),
        textAlign: evaluateTextAlign(textAlign, data),
        maxLines: evaluateInt(maxLines, data),
        overflow: evaluateTextOverflow(overflow, data),
        iconTheme: iconTheme?.toPdf(data));
  }
}
