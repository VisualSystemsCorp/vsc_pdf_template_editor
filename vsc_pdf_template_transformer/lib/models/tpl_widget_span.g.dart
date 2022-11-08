// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_widget_span.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplWidgetSpan _$TplWidgetSpanFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplWidgetSpan',
      json,
      ($checkedConvert) {
        final val = TplWidgetSpan();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('baseline', (v) => val.baseline = v);
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'annotation',
            (v) => val.annotation = const AnnotationBuilderJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplWidgetSpanToJson(TplWidgetSpan instance) =>
    <String, dynamic>{
      'className': instance.className,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'baseline': instance.baseline,
      'style': instance.style?.toJson(),
      'annotation':
          const AnnotationBuilderJsonConverter().toJson(instance.annotation),
    };
