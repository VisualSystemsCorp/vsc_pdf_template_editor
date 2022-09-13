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
        final val = TplTextStyle(
          color: $checkedConvert('color', (v) => v as String?),
          backgroundColor:
              $checkedConvert('backgroundColor', (v) => v as String?),
          fontSize: $checkedConvert('fontSize', (v) => (v as num?)?.toDouble()),
          fontWeight: $checkedConvert('fontWeight', (v) => v as String?),
          fontStyle: $checkedConvert('fontStyle', (v) => v as String?),
          letterSpacing:
              $checkedConvert('letterSpacing', (v) => (v as num?)?.toDouble()),
          wordSpacing:
              $checkedConvert('wordSpacing', (v) => (v as num?)?.toDouble()),
          textBaseline: $checkedConvert('textBaseline', (v) => v as String?),
          height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
          leadingDistribution:
              $checkedConvert('leadingDistribution', (v) => v as String?),
          locale: $checkedConvert('locale', (v) => v as String?),
          foreground: $checkedConvert('foreground', (v) => v as String?),
          background: $checkedConvert('background', (v) => v as String?),
          fontFamily: $checkedConvert('fontFamily', (v) => v as String?),
          package: $checkedConvert('package', (v) => v as String?),
          overflow: $checkedConvert('overflow', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplTextStyleToJson(TplTextStyle instance) =>
    <String, dynamic>{
      'color': instance.color,
      'backgroundColor': instance.backgroundColor,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'fontStyle': instance.fontStyle,
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
      'textBaseline': instance.textBaseline,
      'height': instance.height,
      'leadingDistribution': instance.leadingDistribution,
      'locale': instance.locale,
      'foreground': instance.foreground,
      'background': instance.background,
      'fontFamily': instance.fontFamily,
      'package': instance.package,
      'overflow': instance.overflow,
    };
