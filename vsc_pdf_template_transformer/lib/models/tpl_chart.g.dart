// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplChart _$TplChartFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplChart',
      json,
      ($checkedConvert) {
        final val = TplChart();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'datasets',
            (v) => val.datasets = (v as List<dynamic>?)
                ?.map((e) => const WidgetJsonConverter()
                    .fromJson(e as Map<String, dynamic>?))
                .toList());
        $checkedConvert(
            'grid',
            (v) => val.grid = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'overlay',
            (v) => val.overlay = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'title',
            (v) => val.title = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'bottom',
            (v) => val.bottom = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'left',
            (v) => val.left = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'right',
            (v) => val.right = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplChartToJson(TplChart instance) => <String, dynamic>{
      'className': instance.className,
      'datasets':
          instance.datasets?.map(const WidgetJsonConverter().toJson).toList(),
      'grid': const WidgetJsonConverter().toJson(instance.grid),
      'overlay': const WidgetJsonConverter().toJson(instance.overlay),
      'title': const WidgetJsonConverter().toJson(instance.title),
      'bottom': const WidgetJsonConverter().toJson(instance.bottom),
      'left': const WidgetJsonConverter().toJson(instance.left),
      'right': const WidgetJsonConverter().toJson(instance.right),
    };
