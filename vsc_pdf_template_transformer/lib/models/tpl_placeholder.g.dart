// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_placeholder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPlaceholder _$TplPlaceholderFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPlaceholder',
      json,
      ($checkedConvert) {
        final val = TplPlaceholder();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('strokeWidth', (v) => val.strokeWidth = v);
        $checkedConvert('fallbackWidth', (v) => val.fallbackWidth = v);
        $checkedConvert('fallbackHeight', (v) => val.fallbackHeight = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPlaceholderToJson(TplPlaceholder instance) =>
    <String, dynamic>{
      'className': instance.className,
      'color': instance.color,
      'strokeWidth': instance.strokeWidth,
      'fallbackWidth': instance.fallbackWidth,
      'fallbackHeight': instance.fallbackHeight,
    };
