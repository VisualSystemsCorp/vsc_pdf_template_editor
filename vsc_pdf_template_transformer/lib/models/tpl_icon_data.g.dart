// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_icon_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplIconData _$TplIconDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplIconData',
      json,
      ($checkedConvert) {
        final val = TplIconData();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('codePoint', (v) => val.codePoint = v);
        $checkedConvert(
            'matchTextDirection', (v) => val.matchTextDirection = v);
        return val;
      },
    );

Map<String, dynamic> _$TplIconDataToJson(TplIconData instance) =>
    <String, dynamic>{
      't': instance.t,
      'codePoint': instance.codePoint,
      'matchTextDirection': instance.matchTextDirection,
    };
