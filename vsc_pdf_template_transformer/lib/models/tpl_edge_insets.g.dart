// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_edge_insets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplEdgeInsets _$TplEdgeInsetsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplEdgeInsets',
      json,
      ($checkedConvert) {
        final val = TplEdgeInsets();
        $checkedConvert('left', (v) => val.left = v);
        $checkedConvert('top', (v) => val.top = v);
        $checkedConvert('right', (v) => val.right = v);
        $checkedConvert('bottom', (v) => val.bottom = v);
        $checkedConvert('all', (v) => val.all = v);
        $checkedConvert('vertical', (v) => val.vertical = v);
        $checkedConvert('horizontal', (v) => val.horizontal = v);
        return val;
      },
    );

Map<String, dynamic> _$TplEdgeInsetsToJson(TplEdgeInsets instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'all': instance.all,
      'vertical': instance.vertical,
      'horizontal': instance.horizontal,
    };
