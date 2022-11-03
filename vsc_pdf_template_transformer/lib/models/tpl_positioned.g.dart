// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_positioned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPositioned _$TplPositionedFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPositioned',
      json,
      ($checkedConvert) {
        final val = TplPositioned();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('left', (v) => val.left = v);
        $checkedConvert('top', (v) => val.top = v);
        $checkedConvert('right', (v) => val.right = v);
        $checkedConvert('bottom', (v) => val.bottom = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplPositionedToJson(TplPositioned instance) =>
    <String, dynamic>{
      'className': instance.className,
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
