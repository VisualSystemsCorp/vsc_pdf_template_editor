import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
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
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  dynamic letterSpacing;
  dynamic wordSpacing;
  dynamic lineSpacing;
  dynamic height;
  TplBoxDecoration? background;
  // TODO TextDecoration? decoration;
  dynamic decorationColor;
  TextDecorationStyle? decorationStyle;
  dynamic decorationThickness;
  PdfTextRenderingMode? renderingMode;

  // TODO - George
  // final Font? fontNormal;
  //
  // final Font? fontBold;
  //
  // final Font? fontItalic;
  //
  // final Font? fontBoldItalic;
  //
  // /// The ordered list of font to fall back on when a glyph cannot be found in a higher priority font.
  // final List<Font> fontFallback;

  factory TplTextStyle.fromJson(Map<String, dynamic> json) =>
      _$TplTextStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TplTextStyleToJson(this);

  TextStyle toPdf(Map<String, dynamic> data) {
    return TextStyle(
      inherit: evaluateBool(inherit, data) ?? true,
      color: evaluateColor(color, data),
      fontSize: evaluateDouble(fontSize, data),
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: evaluateDouble(letterSpacing, data),
      wordSpacing: evaluateDouble(wordSpacing, data),
      lineSpacing: evaluateDouble(lineSpacing, data),
      height: evaluateDouble(height, data),
      background: background?.toPdf(data),
      decorationColor: evaluateColor(decorationColor, data),
      decorationStyle: decorationStyle,
      decorationThickness: evaluateDouble(decorationThickness, data),
      renderingMode: renderingMode,
    );
  }
}
