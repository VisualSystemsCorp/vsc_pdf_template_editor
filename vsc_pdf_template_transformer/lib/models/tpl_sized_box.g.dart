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
          width: $checkedConvert('width', (v) => v),
          height: $checkedConvert('height', (v) => v),
          child: $checkedConvert(
              'child',
              (v) => const WidgetJsonConverter()
                  .fromJson(v as Map<String, dynamic>?)),
        );
        $checkedConvert('t', (v) => val.t = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplSizedBoxToJson(TplSizedBox instance) =>
    <String, dynamic>{
      't': instance.t,
      'width': instance.width,
      'height': instance.height,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
