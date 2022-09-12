import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import "package:pdf/widgets.dart" as ws;

part 'tpl_text_style.g.dart';

@JsonSerializable()
class TplTextStyle {
  String? color;
  String? backgroundColor;
  double? fontSize;
  String? fontWeight;
  String? fontStyle;
  double? letterSpacing;
  double? wordSpacing;
  String? textBaseline;
  double? height;
  String? leadingDistribution;
  String? locale;
  String? foreground;
  String? background;
  String? fontFamily;
  String? package = 'vcs_pdf_template_transformer';
  String? overflow;

  TplTextStyle(
      {this.color,
      this.backgroundColor,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.letterSpacing,
      this.wordSpacing,
      this.textBaseline,
      this.height,
      this.leadingDistribution,
      this.locale,
      this.foreground,
      this.background,
      this.fontFamily,
      this.package,
      this.overflow});

  factory TplTextStyle.fromJson(Map<String, dynamic> json) =>
      _$TplTextStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TplTextStyleToJson(this);

  static TplTextStyle? from(ws.TextStyle value) {
    if(value == null) return null;

    TplTextStyle result = TplTextStyle();
    result.color = value.color.toString();
    result.backgroundColor = value.background?.color.toString();
    result.fontSize = value.fontSize;
    result.fontWeight = value.fontWeight.toString();
    result.fontStyle = value.fontStyle.toString();
    result.letterSpacing = value.letterSpacing;
    result.wordSpacing = value.wordSpacing;
    //result.textBaseline = value.textBaseline.toString();
    result.height = value.height;
    //result.leadingDistribution = value.leadingDistribution;
    //result.locale = value.decorationStyle.locale;

    //result.foreground = value.decoration.foregtround;
    result.background = value.background.toString();
    result.fontFamily = value.font?.fontName.toString();
    //result.overflow = value.overflow;;

    return result;
  }

  static ws.TextStyle to(TplTextStyle? value) {
    ws.TextStyle result = ws.TextStyle();
    if(value == null) return result;
    /*
    PdfColor? color,
    Font? font,
    Font? fontNormal,
    Font? fontBold,
    Font? fontItalic,
    Font? fontBoldItalic,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    double letterSpacingFactor = 1.0,
    double letterSpacingDelta = 0.0,
    double wordSpacingFactor = 1.0,
    double wordSpacingDelta = 0.0,
    double heightFactor = 1.0,
    double heightDelta = 0.0,
    TextDecoration decoration = TextDecoration.none,
     */
    //TODO: Think about more - whar fields and how to copoy
    result = result.apply(
        color: value.color != null ? PdfColor.fromHex(value.color!) : null);
    return result;
  }
}
