// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTextStyle _$TplTextStyleFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplTextStyle',
      json,
      ($checkedConvert) {
        final val = TplTextStyle();
        $checkedConvert('inherit', (v) => val.inherit = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('fontSize', (v) => val.fontSize = v);
        $checkedConvert(
            'fontWeight',
            (v) =>
                val.fontWeight = $enumDecodeNullable(_$FontWeightEnumMap, v));
        $checkedConvert('fontStyle',
            (v) => val.fontStyle = $enumDecodeNullable(_$FontStyleEnumMap, v));
        $checkedConvert('letterSpacing', (v) => val.letterSpacing = v);
        $checkedConvert('wordSpacing', (v) => val.wordSpacing = v);
        $checkedConvert('lineSpacing', (v) => val.lineSpacing = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert(
            'background',
            (v) => val.background = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplTextDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert('decorationColor', (v) => val.decorationColor = v);
        $checkedConvert(
            'decorationStyle',
            (v) => val.decorationStyle =
                $enumDecodeNullable(_$TextDecorationStyleEnumMap, v));
        $checkedConvert(
            'decorationThickness', (v) => val.decorationThickness = v);
        $checkedConvert(
            'renderingMode',
            (v) => val.renderingMode =
                $enumDecodeNullable(_$PdfTextRenderingModeEnumMap, v));
        $checkedConvert(
            'font',
            (v) => val.font =
                v == null ? null : TplFont.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'fontNormal',
            (v) => val.fontNormal =
                v == null ? null : TplFont.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'fontBold',
            (v) => val.fontBold =
                v == null ? null : TplFont.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'fontItalic',
            (v) => val.fontItalic =
                v == null ? null : TplFont.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'fontBoldItalic',
            (v) => val.fontBoldItalic =
                v == null ? null : TplFont.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'fontFallback',
            (v) => val.fontFallback = (v as List<dynamic>?)
                ?.map((e) => TplFont.fromJson(e as Map<String, dynamic>))
                .toList());
        return val;
      },
    );

Map<String, dynamic> _$TplTextStyleToJson(TplTextStyle instance) =>
    <String, dynamic>{
      'inherit': instance.inherit,
      'color': instance.color,
      'fontSize': instance.fontSize,
      'fontWeight': _$FontWeightEnumMap[instance.fontWeight],
      'fontStyle': _$FontStyleEnumMap[instance.fontStyle],
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
      'lineSpacing': instance.lineSpacing,
      'height': instance.height,
      'background': instance.background?.toJson(),
      'decoration': instance.decoration?.toJson(),
      'decorationColor': instance.decorationColor,
      'decorationStyle': _$TextDecorationStyleEnumMap[instance.decorationStyle],
      'decorationThickness': instance.decorationThickness,
      'renderingMode': _$PdfTextRenderingModeEnumMap[instance.renderingMode],
      'font': instance.font?.toJson(),
      'fontNormal': instance.fontNormal?.toJson(),
      'fontBold': instance.fontBold?.toJson(),
      'fontItalic': instance.fontItalic?.toJson(),
      'fontBoldItalic': instance.fontBoldItalic?.toJson(),
      'fontFallback': instance.fontFallback?.map((e) => e.toJson()).toList(),
    };

const _$FontWeightEnumMap = {
  FontWeight.normal: 'normal',
  FontWeight.bold: 'bold',
};

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};

const _$TextDecorationStyleEnumMap = {
  TextDecorationStyle.solid: 'solid',
  TextDecorationStyle.double: 'double',
};

const _$PdfTextRenderingModeEnumMap = {
  PdfTextRenderingMode.fill: 'fill',
  PdfTextRenderingMode.stroke: 'stroke',
  PdfTextRenderingMode.fillAndStroke: 'fillAndStroke',
  PdfTextRenderingMode.invisible: 'invisible',
  PdfTextRenderingMode.fillAndClip: 'fillAndClip',
  PdfTextRenderingMode.strokeAndClip: 'strokeAndClip',
  PdfTextRenderingMode.fillStrokeAndClip: 'fillStrokeAndClip',
  PdfTextRenderingMode.clip: 'clip',
};
