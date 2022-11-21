// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplIcon _$TplIconFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplIcon',
      json,
      ($checkedConvert) {
        final val = TplIcon();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'iconData',
            (v) => val.iconData = v == null
                ? null
                : TplIconData.fromJson(v as Map<String, dynamic>));
        $checkedConvert('size', (v) => val.size = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('textDirection', (v) => val.textDirection = v);
        $checkedConvert('font', (v) => val.font = v);
        return val;
      },
    );

Map<String, dynamic> _$TplIconToJson(TplIcon instance) => <String, dynamic>{
      't': instance.t,
      'iconData': instance.iconData?.toJson(),
      'size': instance.size,
      'color': instance.color,
      'textDirection': instance.textDirection,
      'font': instance.font,
    };
