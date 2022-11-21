// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_clip_rrect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplClipRRect _$TplClipRRectFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplClipRRect',
      json,
      ($checkedConvert) {
        final val = TplClipRRect();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('horizontalRadius', (v) => val.horizontalRadius = v);
        $checkedConvert('verticalRadius', (v) => val.verticalRadius = v);
        return val;
      },
    );

Map<String, dynamic> _$TplClipRRectToJson(TplClipRRect instance) =>
    <String, dynamic>{
      't': instance.t,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'horizontalRadius': instance.horizontalRadius,
      'verticalRadius': instance.verticalRadius,
    };
