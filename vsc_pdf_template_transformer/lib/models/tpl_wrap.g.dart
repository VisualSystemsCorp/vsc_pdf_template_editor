// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_wrap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplWrap _$TplWrapFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplWrap',
      json,
      ($checkedConvert) {
        final val = TplWrap();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('direction', (v) => val.direction = v);
        $checkedConvert('alignment', (v) => val.alignment = v);
        $checkedConvert('spacing', (v) => val.spacing = v);
        $checkedConvert('runAlignment', (v) => val.runAlignment = v);
        $checkedConvert('runSpacing', (v) => val.runSpacing = v);
        $checkedConvert(
            'crossAxisAlignment', (v) => val.crossAxisAlignment = v);
        $checkedConvert('verticalDirection', (v) => val.verticalDirection = v);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplWrapToJson(TplWrap instance) => <String, dynamic>{
      'className': instance.className,
      'direction': instance.direction,
      'alignment': instance.alignment,
      'spacing': instance.spacing,
      'runAlignment': instance.runAlignment,
      'runSpacing': instance.runSpacing,
      'crossAxisAlignment': instance.crossAxisAlignment,
      'verticalDirection': instance.verticalDirection,
      'children': instance.children,
    };
