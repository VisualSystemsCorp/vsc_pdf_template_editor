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
        $checkedConvert('type', (v) => val.type = v);
        $checkedConvert('textDirection', (v) => val.textDirection = v);
        $checkedConvert('start', (v) => val.start = v);
        $checkedConvert('end', (v) => val.end = v);
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
      'type': instance.type,
      'textDirection': instance.textDirection,
      'start': instance.start,
      'end': instance.end,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
