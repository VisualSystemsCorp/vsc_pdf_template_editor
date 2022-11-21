// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_bar_data_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBarDataSet _$TplBarDataSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBarDataSet',
      json,
      ($checkedConvert) {
        final val = TplBarDataSet();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'data',
            (v) => val.data = (v as List<dynamic>?)
                ?.map((e) =>
                    TplPointChartValue.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('value', (v) => val.value = v);
        $checkedConvert('legend', (v) => val.legend = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('borderColor', (v) => val.borderColor = v);
        $checkedConvert('borderWidth', (v) => val.borderWidth = v);
        $checkedConvert('drawBorder', (v) => val.drawBorder = v);
        $checkedConvert('drawSurface', (v) => val.drawSurface = v);
        $checkedConvert('surfaceOpacity', (v) => val.surfaceOpacity = v);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('offset', (v) => val.offset = v);
        $checkedConvert('axis', (v) => val.axis = v);
        $checkedConvert('pointColor', (v) => val.pointColor = v);
        $checkedConvert('pointSize', (v) => val.pointSize = v);
        $checkedConvert('drawPoints', (v) => val.drawPoints = v);
        $checkedConvert('valuePosition', (v) => val.valuePosition = v);
        return val;
      },
    );

Map<String, dynamic> _$TplBarDataSetToJson(TplBarDataSet instance) =>
    <String, dynamic>{
      't': instance.t,
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'value': instance.value,
      'legend': instance.legend,
      'color': instance.color,
      'borderColor': instance.borderColor,
      'borderWidth': instance.borderWidth,
      'drawBorder': instance.drawBorder,
      'drawSurface': instance.drawSurface,
      'surfaceOpacity': instance.surfaceOpacity,
      'width': instance.width,
      'offset': instance.offset,
      'axis': instance.axis,
      'pointColor': instance.pointColor,
      'pointSize': instance.pointSize,
      'drawPoints': instance.drawPoints,
      'valuePosition': instance.valuePosition,
    };
