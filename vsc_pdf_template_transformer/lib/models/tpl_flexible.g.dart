// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_flexible.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFlexible _$TplFlexibleFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplFlexible',
      json,
      ($checkedConvert) {
        final val = TplFlexible();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('flex', (v) => val.flex = v);
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplFlexibleToJson(TplFlexible instance) =>
    <String, dynamic>{
      't': instance.t,
      'flex': instance.flex,
      'fit': instance.fit,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
