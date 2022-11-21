// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_clip_rect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplClipRect _$TplClipRectFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplClipRect',
      json,
      ($checkedConvert) {
        final val = TplClipRect();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplClipRectToJson(TplClipRect instance) =>
    <String, dynamic>{
      't': instance.t,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
