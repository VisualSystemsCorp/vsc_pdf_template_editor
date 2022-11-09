// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_chart_legend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplChartLegend _$TplChartLegendFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplChartLegend',
      json,
      ($checkedConvert) {
        final val = TplChartLegend();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'textStyle',
            (v) => val.textStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'position',
            (v) => val.position = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('direction', (v) => val.direction = v);
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplChartLegendToJson(TplChartLegend instance) =>
    <String, dynamic>{
      'className': instance.className,
      'textStyle': instance.textStyle?.toJson(),
      'position': instance.position?.toJson(),
      'direction': instance.direction,
      'decoration': instance.decoration?.toJson(),
      'padding': instance.padding?.toJson(),
    };
