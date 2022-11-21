// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_aspect_ratio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAspectRatio _$TplAspectRatioFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAspectRatio',
      json,
      ($checkedConvert) {
        final val = TplAspectRatio();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('aspectRatio', (v) => val.aspectRatio = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplAspectRatioToJson(TplAspectRatio instance) =>
    <String, dynamic>{
      't': instance.t,
      'aspectRatio': instance.aspectRatio,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
