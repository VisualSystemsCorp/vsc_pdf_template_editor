// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_grid_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplGridView _$TplGridViewFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplGridView',
      json,
      ($checkedConvert) {
        final val = TplGridView();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'direction',
            (v) => val.direction =
                $enumDecodeNullable(_$AxisEnumMap, v) ?? Axis.vertical);
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('crossAxisCount', (v) => val.crossAxisCount = v);
        $checkedConvert('mainAxisSpacing', (v) => val.mainAxisSpacing = v);
        $checkedConvert('crossAxisSpacing', (v) => val.crossAxisSpacing = v);
        $checkedConvert('childAspectRatio', (v) => val.childAspectRatio = v);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplGridViewToJson(TplGridView instance) =>
    <String, dynamic>{
      'className': instance.className,
      'direction': _$AxisEnumMap[instance.direction]!,
      'padding': instance.padding?.toJson(),
      'crossAxisCount': instance.crossAxisCount,
      'mainAxisSpacing': instance.mainAxisSpacing,
      'crossAxisSpacing': instance.crossAxisSpacing,
      'childAspectRatio': instance.childAspectRatio,
      'children': instance.children,
    };

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};
