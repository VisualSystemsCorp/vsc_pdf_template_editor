// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_listview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplListView _$TplListViewFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplListView',
      json,
      ($checkedConvert) {
        final val = TplListView();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('direction', (v) => val.direction = v);
        $checkedConvert('reverse', (v) => val.reverse = v);
        $checkedConvert('spacing', (v) => val.spacing = v);
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplListViewToJson(TplListView instance) =>
    <String, dynamic>{
      't': instance.t,
      'direction': instance.direction,
      'reverse': instance.reverse,
      'spacing': instance.spacing,
      'padding': instance.padding?.toJson(),
      'children': instance.children,
    };
