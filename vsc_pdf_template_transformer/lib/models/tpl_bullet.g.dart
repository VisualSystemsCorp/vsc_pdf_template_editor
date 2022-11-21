// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_bullet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBullet _$TplBulletFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplBullet',
      json,
      ($checkedConvert) {
        final val = TplBullet();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('text', (v) => val.text = v);
        $checkedConvert('textAlign', (v) => val.textAlign = v);
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'bulletMargin',
            (v) => val.bulletMargin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('bulletSize', (v) => val.bulletSize = v);
        $checkedConvert('bulletShape', (v) => val.bulletShape = v);
        $checkedConvert('bulletColor', (v) => val.bulletColor = v);
        return val;
      },
    );

Map<String, dynamic> _$TplBulletToJson(TplBullet instance) => <String, dynamic>{
      't': instance.t,
      'text': instance.text,
      'textAlign': instance.textAlign,
      'style': instance.style?.toJson(),
      'margin': instance.margin?.toJson(),
      'padding': instance.padding?.toJson(),
      'bulletMargin': instance.bulletMargin?.toJson(),
      'bulletSize': instance.bulletSize,
      'bulletShape': instance.bulletShape,
      'bulletColor': instance.bulletColor,
    };
