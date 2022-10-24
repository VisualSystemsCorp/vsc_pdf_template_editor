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
  TextDecorationStyle? decorationStyle;
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

  TextStyle toPdf(Map<String, dynamic> data) {
    return TextStyle(
      inherit: evaluateBool(inherit, data) ?? true,
      color: evaluateColor(color, data),
      fontSize: evaluateDouble(fontSize, data),
      font: evaluateFont(font, data),
      fontNormal: evaluateFont(fontNormal, data),
      fontBold: evaluateFont(fontBold, data),
      fontItalic: evaluateFont(fontItalic, data),
      fontBoldItalic: evaluateFont(fontBoldItalic, data),
      fontWeight: evaluateFontWeight(fontWeight, data),
      fontStyle: evaluateFontStyle(fontStyle, data),
      fontFallback: evaluateFontList(fontFallback, data),
      letterSpacing: evaluateDouble(letterSpacing, data),
      wordSpacing: evaluateDouble(wordSpacing, data),
      lineSpacing: evaluateDouble(lineSpacing, data),
      height: evaluateDouble(height, data),
      background: background?.toPdf(data),
      decoration: evaluateTextDecoration(decoration, data),
      decorationColor: evaluateColor(decorationColor, data),
      decorationStyle: decorationStyle,
      decorationThickness: evaluateDouble(decorationThickness, data),
      renderingMode: evaluatePdfTextRenderingMode(renderingMode, data),
    );
  }
}
