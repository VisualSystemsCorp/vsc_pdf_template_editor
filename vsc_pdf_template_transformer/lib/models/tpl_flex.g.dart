// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_flex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFlex _$TplFlexFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplFlex',
      json,
      ($checkedConvert) {
        final val = TplFlex();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('direction', (v) => val.direction = v);
        $checkedConvert('mainAxisAlignment', (v) => val.mainAxisAlignment = v);
        $checkedConvert('mainAxisSize', (v) => val.mainAxisSize = v);
        $checkedConvert(
            'crossAxisAlignment', (v) => val.crossAxisAlignment = v);
        $checkedConvert('verticalDirection', (v) => val.verticalDirection = v);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplFlexToJson(TplFlex instance) => <String, dynamic>{
      'className': instance.className,
      'direction': instance.direction,
      'mainAxisAlignment': instance.mainAxisAlignment,
      'mainAxisSize': instance.mainAxisSize,
      'crossAxisAlignment': instance.crossAxisAlignment,
      'verticalDirection': instance.verticalDirection,
      'children': instance.children,
    };
