// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_pie_data_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPieDataSet _$TplPieDataSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPieDataSet',
      json,
      ($checkedConvert) {
        final val = TplPieDataSet();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('value', (v) => val.value = v);
        $checkedConvert('legend', (v) => val.legend = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('borderColor', (v) => val.borderColor = v);
        $checkedConvert('borderWidth', (v) => val.borderWidth = v);
        $checkedConvert('drawBorder', (v) => val.drawBorder = v);
        $checkedConvert('drawSurface', (v) => val.drawSurface = v);
        $checkedConvert('surfaceOpacity', (v) => val.surfaceOpacity = v);
        $checkedConvert('offset', (v) => val.offset = v);
        $checkedConvert(
            'legendStyle',
            (v) => val.legendStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert('legendAlign', (v) => val.legendAlign = v);
        $checkedConvert('legendPosition', (v) => val.legendPosition = v);
        $checkedConvert('legendLineWidth', (v) => val.legendLineWidth = v);
        $checkedConvert('legendLineColor', (v) => val.legendLineColor = v);
        $checkedConvert(
            'legendWidget',
            (v) => val.legendWidget = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('legendOffset', (v) => val.legendOffset = v);
        $checkedConvert('innerRadius', (v) => val.innerRadius = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPieDataSetToJson(TplPieDataSet instance) =>
    <String, dynamic>{
      'className': instance.className,
      'value': instance.value,
      'legend': instance.legend,
      'color': instance.color,
      'borderColor': instance.borderColor,
      'borderWidth': instance.borderWidth,
      'drawBorder': instance.drawBorder,
      'drawSurface': instance.drawSurface,
      'surfaceOpacity': instance.surfaceOpacity,
      'offset': instance.offset,
      'legendStyle': instance.legendStyle?.toJson(),
      'legendAlign': instance.legendAlign,
      'legendPosition': instance.legendPosition,
      'legendLineWidth': instance.legendLineWidth,
      'legendLineColor': instance.legendLineColor,
      'legendWidget': const WidgetJsonConverter().toJson(instance.legendWidget),
      'legendOffset': instance.legendOffset,
      'innerRadius': instance.innerRadius,
    };
