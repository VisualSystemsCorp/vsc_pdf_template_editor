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
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('direction', (v) => val.direction = v);
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
      't': instance.t,
      'direction': instance.direction,
      'padding': instance.padding?.toJson(),
      'crossAxisCount': instance.crossAxisCount,
      'mainAxisSpacing': instance.mainAxisSpacing,
      'crossAxisSpacing': instance.crossAxisSpacing,
      'childAspectRatio': instance.childAspectRatio,
      'children': instance.children,
    };
