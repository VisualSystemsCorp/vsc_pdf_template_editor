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
        $checkedConvert('fontWeight', (v) => val.fontWeight = v);
        $checkedConvert('fontStyle', (v) => val.fontStyle = v);
        $checkedConvert('letterSpacing', (v) => val.letterSpacing = v);
        $checkedConvert('wordSpacing', (v) => val.wordSpacing = v);
        $checkedConvert('lineSpacing', (v) => val.lineSpacing = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert(
            'background',
            (v) => val.background = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert('decoration', (v) => val.decoration = v);
        $checkedConvert('decorationColor', (v) => val.decorationColor = v);
        $checkedConvert(
            'decorationStyle',
            (v) => val.decorationStyle =
                $enumDecodeNullable(_$TextDecorationStyleEnumMap, v));
        $checkedConvert(
            'decorationThickness', (v) => val.decorationThickness = v);
        $checkedConvert('renderingMode', (v) => val.renderingMode = v);
        $checkedConvert('font', (v) => val.font = v);
        $checkedConvert('fontNormal', (v) => val.fontNormal = v);
        $checkedConvert('fontBold', (v) => val.fontBold = v);
        $checkedConvert('fontItalic', (v) => val.fontItalic = v);
        $checkedConvert('fontBoldItalic', (v) => val.fontBoldItalic = v);
        $checkedConvert(
            'fontFallback', (v) => val.fontFallback = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplTextStyleToJson(TplTextStyle instance) =>
    <String, dynamic>{
      'inherit': instance.inherit,
      'color': instance.color,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'fontStyle': instance.fontStyle,
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
      'lineSpacing': instance.lineSpacing,
      'height': instance.height,
      'background': instance.background?.toJson(),
      'decoration': instance.decoration,
      'decorationColor': instance.decorationColor,
      'decorationStyle': _$TextDecorationStyleEnumMap[instance.decorationStyle],
      'decorationThickness': instance.decorationThickness,
      'renderingMode': instance.renderingMode,
      'font': instance.font,
      'fontNormal': instance.fontNormal,
      'fontBold': instance.fontBold,
      'fontItalic': instance.fontItalic,
      'fontBoldItalic': instance.fontBoldItalic,
      'fontFallback': instance.fontFallback,
    };

const _$TextDecorationStyleEnumMap = {
  TextDecorationStyle.solid: 'solid',
  TextDecorationStyle.double: 'double',
};
