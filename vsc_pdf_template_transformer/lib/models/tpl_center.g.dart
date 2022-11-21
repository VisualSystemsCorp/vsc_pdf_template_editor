// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_center.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplCenter _$TplCenterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplCenter',
      json,
      ($checkedConvert) {
        final val = TplCenter();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('widthFactor', (v) => val.widthFactor = v);
        $checkedConvert('heightFactor', (v) => val.heightFactor = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplCenterToJson(TplCenter instance) => <String, dynamic>{
      't': instance.t,
      'widthFactor': instance.widthFactor,
      'heightFactor': instance.heightFactor,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
