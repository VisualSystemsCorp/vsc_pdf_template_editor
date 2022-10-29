// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_decorated_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplDecoratedBox _$TplDecoratedBoxFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplDecoratedBox',
      json,
      ($checkedConvert) {
        final val = TplDecoratedBox();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert('position', (v) => val.position = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplDecoratedBoxToJson(TplDecoratedBox instance) =>
    <String, dynamic>{
      'className': instance.className,
      'decoration': instance.decoration?.toJson(),
      'position': instance.position,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
