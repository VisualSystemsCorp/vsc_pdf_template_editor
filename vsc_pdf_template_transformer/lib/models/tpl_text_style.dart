import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_font.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_decoration.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_text_style.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTextStyle {
  TplTextStyle();

  dynamic inherit;
  dynamic color;
  dynamic fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  dynamic letterSpacing;
  dynamic wordSpacing;
  dynamic lineSpacing;
  dynamic height;
  TplBoxDecoration? background;
  TplTextDecoration? decoration;
  dynamic decorationColor;
  TextDecorationStyle? decorationStyle;
  dynamic decorationThickness;
  PdfTextRenderingMode? renderingMode;
  TplFont? font;
  TplFont? fontNormal;
  TplFont? fontBold;
  TplFont? fontItalic;
  TplFont? fontBoldItalic;
  List<TplFont>? fontFallback;

  factory TplTextStyle.fromJson(Map<String, dynamic> json) =>
      _$TplTextStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TplTextStyleToJson(this);

  TextStyle toPdf(Map<String, dynamic> data) {
    return TextStyle(
      inherit: evaluateBool(inherit, data) ?? true,
      color: evaluateColor(color, data),
      fontSize: evaluateDouble(fontSize, data),
      font: font?.toPdf(data),
      fontNormal: fontNormal?.toPdf(data),
      fontBold: fontBold?.toPdf(data),
      fontItalic: fontItalic?.toPdf(data),
      fontBoldItalic: fontBoldItalic?.toPdf(data),
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFallback: TplFont.getFontList(fontFallback, data),
      letterSpacing: evaluateDouble(letterSpacing, data),
      wordSpacing: evaluateDouble(wordSpacing, data),
      lineSpacing: evaluateDouble(lineSpacing, data),
      height: evaluateDouble(height, data),
      background: background?.toPdf(data),
      decoration: decoration?.toPdf(data),
      decorationColor: evaluateColor(decorationColor, data),
      decorationStyle: decorationStyle,
      decorationThickness: evaluateDouble(decorationThickness, data),
      renderingMode: renderingMode,
    );
  }
}
