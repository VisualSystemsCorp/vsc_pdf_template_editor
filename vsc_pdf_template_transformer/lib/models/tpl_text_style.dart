import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
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
  dynamic fontWeight;
  dynamic fontStyle;
  dynamic letterSpacing;
  dynamic wordSpacing;
  dynamic lineSpacing;
  dynamic height;
  TplBoxDecoration? background;
  dynamic decoration;
  dynamic decorationColor;
  dynamic decorationStyle;
  dynamic decorationThickness;
  dynamic renderingMode;
  dynamic font;
  dynamic fontNormal;
  dynamic fontBold;
  dynamic fontItalic;
  dynamic fontBoldItalic;
  List<dynamic>? fontFallback;

  factory TplTextStyle.fromJson(Map<String, dynamic> json) =>
      _$TplTextStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TplTextStyleToJson(this);

  Future<TextStyle> toPdf(Map<String, dynamic> data) async {
    return TextStyle(
      inherit: await evaluateBool(inherit, data) ?? true,
      color: await evaluateColor(color, data),
      fontSize: await evaluateDouble(fontSize, data),
      font: await evaluateFont(font, data),
      fontNormal: await evaluateFont(fontNormal, data),
      fontBold: await evaluateFont(fontBold, data),
      fontItalic: await evaluateFont(fontItalic, data),
      fontBoldItalic: await evaluateFont(fontBoldItalic, data),
      fontWeight: await evaluateFontWeight(fontWeight, data),
      fontStyle: await evaluateFontStyle(fontStyle, data),
      fontFallback: await evaluateFontList(fontFallback, data),
      letterSpacing: await evaluateDouble(letterSpacing, data),
      wordSpacing: await evaluateDouble(wordSpacing, data),
      lineSpacing: await evaluateDouble(lineSpacing, data),
      height: await evaluateDouble(height, data),
      background: await background?.toPdf(data),
      decoration: await evaluateTextDecoration(decoration, data),
      decorationColor: await evaluateColor(decorationColor, data),
      decorationStyle: await evaluateTextDecorationStyle(decorationStyle, data),
      decorationThickness: await evaluateDouble(decorationThickness, data),
      renderingMode: await evaluatePdfTextRenderingMode(renderingMode, data),
    );
  }
}
