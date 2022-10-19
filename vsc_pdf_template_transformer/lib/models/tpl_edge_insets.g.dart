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
        final val = TplEdgeInsets(
          left: $checkedConvert('left', (v) => (v as num?)?.toDouble() ?? 0),
          top: $checkedConvert('top', (v) => (v as num?)?.toDouble() ?? 0),
          right: $checkedConvert('right', (v) => (v as num?)?.toDouble() ?? 0),
          bottom:
              $checkedConvert('bottom', (v) => (v as num?)?.toDouble() ?? 0),
          all: $checkedConvert('all', (v) => (v as num?)?.toDouble() ?? 0),
          vertical:
              $checkedConvert('vertical', (v) => (v as num?)?.toDouble() ?? 0),
          horizontal: $checkedConvert(
              'horizontal', (v) => (v as num?)?.toDouble() ?? 0),
          type: $checkedConvert('type', (v) => v as String? ?? 'zero'),
        );
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
      'type': instance.type,
    };
