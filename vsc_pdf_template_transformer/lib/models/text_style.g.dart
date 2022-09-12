// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTextStyle _$TplTextStyleFromJson(Map<String, dynamic> json) => TplTextStyle(
      color: json['color'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: json['fontWeight'] as String?,
      fontStyle: json['fontStyle'] as String?,
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
      textBaseline: json['textBaseline'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      leadingDistribution: json['leadingDistribution'] as String?,
      locale: json['locale'] as String?,
      foreground: json['foreground'] as String?,
      background: json['background'] as String?,
      fontFamily: json['fontFamily'] as String?,
      package: json['package'] as String?,
      overflow: json['overflow'] as String?,
    );

Map<String, dynamic> _$TplTextStyleToJson(TplTextStyle instance) => <String, dynamic>{
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
