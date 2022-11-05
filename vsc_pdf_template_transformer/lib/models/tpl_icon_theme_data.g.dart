// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_icon_theme_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplIconThemeData _$TplIconThemeDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplIconThemeData',
      json,
      ($checkedConvert) {
        final val = TplIconThemeData();
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('opacity', (v) => val.opacity = v);
        $checkedConvert('size', (v) => val.size = v);
        $checkedConvert('font', (v) => val.font = v);
        return val;
      },
    );

Map<String, dynamic> _$TplIconThemeDataToJson(TplIconThemeData instance) =>
    <String, dynamic>{
      'color': instance.color,
      'opacity': instance.opacity,
      'size': instance.size,
      'font': instance.font,
    };
