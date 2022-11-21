// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_point_data_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPointDataSet _$TplPointDataSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPointDataSet',
      json,
      ($checkedConvert) {
        final val = TplPointDataSet();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'data',
            (v) => val.data = (v as List<dynamic>?)
                ?.map((e) =>
                    TplPointChartValue.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('legend', (v) => val.legend = v);
        $checkedConvert('pointSize', (v) => val.pointSize = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('drawPoints', (v) => val.drawPoints = v);
        $checkedConvert('valuePosition', (v) => val.valuePosition = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPointDataSetToJson(TplPointDataSet instance) =>
    <String, dynamic>{
      't': instance.t,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'legend': instance.legend,
      'pointSize': instance.pointSize,
      'color': instance.color,
      'drawPoints': instance.drawPoints,
      'valuePosition': instance.valuePosition,
    };
