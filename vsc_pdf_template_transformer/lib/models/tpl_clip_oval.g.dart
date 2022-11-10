// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_clip_oval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplClipOval _$TplClipOvalFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplClipOval',
      json,
      ($checkedConvert) {
        final val = TplClipOval();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplClipOvalToJson(TplClipOval instance) =>
    <String, dynamic>{
      'className': instance.className,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
