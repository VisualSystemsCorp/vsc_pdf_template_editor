// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_sized_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplSizedBox _$TplSizedBoxFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplSizedBox',
      json,
      ($checkedConvert) {
        final val = TplSizedBox(
          id: $checkedConvert('id', (v) => v as String?),
          width: $checkedConvert(
              'width',
              (v) => v == null
                  ? null
                  : TplString.fromJson(v as Map<String, dynamic>)),
          height: $checkedConvert(
              'height',
              (v) => v == null
                  ? null
                  : TplString.fromJson(v as Map<String, dynamic>)),
          child: $checkedConvert(
              'child',
              (v) => const WidgetJsonConverter()
                  .fromJson(v as Map<String, dynamic>?)),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplSizedBoxToJson(TplSizedBox instance) =>
    <String, dynamic>{
      'className': instance.className,
      'id': instance.id,
      'width': instance.width?.toJson(),
      'height': instance.height?.toJson(),
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
