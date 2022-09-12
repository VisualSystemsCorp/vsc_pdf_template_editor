// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplText _$TplTextFromJson(Map<String, dynamic> json) => TplText(
      text: json['text'] as String,
      style: json['style'] == null
          ? null
          : TplTextStyle.fromJson(json['style'] as Map<String, dynamic>),
      textAlign: json['textAlign'] as String? ?? 'left',
      textDirection: json['textDirection'] as String? ?? 'lrt',
      softWrap: json['softWrap'] as bool? ?? true,
      tightBounds: json['tightBounds'] as bool? ?? false,
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble() ?? 1.0,
      maxLines: json['maxLines'] as int? ?? 1,
      overflow: json['overflow'] as String? ?? 'clip',
    )..className = json['className'] as String;

Map<String, dynamic> _$TplTextToJson(TplText instance) => <String, dynamic>{
      'className': instance.className,
      'text': instance.text,
      'style': instance.style,
      'textAlign': instance.textAlign,
      'textDirection': instance.textDirection,
      'softWrap': instance.softWrap,
      'tightBounds': instance.tightBounds,
      'textScaleFactor': instance.textScaleFactor,
      'maxLines': instance.maxLines,
      'overflow': instance.overflow,
    };
