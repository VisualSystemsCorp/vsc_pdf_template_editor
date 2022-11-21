// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_limited_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplLimitedBox _$TplLimitedBoxFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplLimitedBox',
      json,
      ($checkedConvert) {
        final val = TplLimitedBox();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('maxWidth', (v) => val.maxWidth = v);
        $checkedConvert('maxHeight', (v) => val.maxHeight = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplLimitedBoxToJson(TplLimitedBox instance) =>
    <String, dynamic>{
      't': instance.t,
      'maxWidth': instance.maxWidth,
      'maxHeight': instance.maxHeight,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
