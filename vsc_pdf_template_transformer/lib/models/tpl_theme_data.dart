import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_icon_theme_data.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_theme_data.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplThemeData {
  TplThemeData();

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

  Future<pw.ThemeData> toPdf(Map<String, dynamic> data) async {
    return pw.ThemeData(
        defaultTextStyle: await defaultTextStyle?.toPdf(data),
        paragraphStyle: await paragraphStyle?.toPdf(data),
        header0: await header0?.toPdf(data),
        header1: await header1?.toPdf(data),
        header2: await header2?.toPdf(data),
        header3: await header3?.toPdf(data),
        header4: await header4?.toPdf(data),
        header5: await header5?.toPdf(data),
        bulletStyle: await bulletStyle?.toPdf(data),
        tableHeader: await tableHeader?.toPdf(data),
        tableCell: await tableCell?.toPdf(data),
        softWrap: await evaluateBool(softWrap, data),
        textAlign: await evaluateTextAlign(textAlign, data),
        maxLines: await evaluateInt(maxLines, data),
        overflow: await evaluateTextOverflow(overflow, data),
        iconTheme: await iconTheme?.toPdf(data));
  }
}
