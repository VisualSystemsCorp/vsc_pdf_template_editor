// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_line_data_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplLineDataSet _$TplLineDataSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplLineDataSet',
      json,
      ($checkedConvert) {
        final val = TplLineDataSet();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'data',
            (v) => val.data = (v as List<dynamic>?)
                ?.map((e) =>
                    TplPointChartValue.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('legend', (v) => val.legend = v);
        $checkedConvert('pointColor', (v) => val.pointColor = v);
        $checkedConvert('pointSize', (v) => val.pointSize = v);
        $checkedConvert('lineWidth', (v) => val.lineWidth = v);
        $checkedConvert('drawLine', (v) => val.drawLine = v);
        $checkedConvert('lineColor', (v) => val.lineColor = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('drawPoints', (v) => val.drawPoints = v);
        $checkedConvert('valuePosition', (v) => val.valuePosition = v);
        $checkedConvert('drawSurface', (v) => val.drawSurface = v);
        $checkedConvert('surfaceOpacity', (v) => val.surfaceOpacity = v);
        $checkedConvert('surfaceColor', (v) => val.surfaceColor = v);
        $checkedConvert('isCurved', (v) => val.isCurved = v);
        $checkedConvert('smoothness', (v) => val.smoothness = v);
        return val;
      },
    );

Map<String, dynamic> _$TplLineDataSetToJson(TplLineDataSet instance) =>
    <String, dynamic>{
      't': instance.t,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'legend': instance.legend,
      'pointColor': instance.pointColor,
      'pointSize': instance.pointSize,
      'lineWidth': instance.lineWidth,
      'drawLine': instance.drawLine,
      'lineColor': instance.lineColor,
      'color': instance.color,
      'drawPoints': instance.drawPoints,
      'valuePosition': instance.valuePosition,
      'drawSurface': instance.drawSurface,
      'surfaceOpacity': instance.surfaceOpacity,
      'surfaceColor': instance.surfaceColor,
      'isCurved': instance.isCurved,
      'smoothness': instance.smoothness,
    };
