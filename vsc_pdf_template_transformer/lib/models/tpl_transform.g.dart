// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_transform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTransform _$TplTransformFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplTransform',
      json,
      ($checkedConvert) {
        final val = TplTransform();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('transform', (v) => val.transform = v);
        $checkedConvert(
            'origin',
            (v) => val.origin = v == null
                ? null
                : TplPdfPoint.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'alignment',
            (v) => val.alignment = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('adjustLayout', (v) => val.adjustLayout = v);
        $checkedConvert('unconstrained', (v) => val.unconstrained = v);
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert('angle', (v) => val.angle = v);
        $checkedConvert(
            'offset',
            (v) => val.offset = v == null
                ? null
                : TplPdfPoint.fromJson(v as Map<String, dynamic>));
        $checkedConvert('scale', (v) => val.scale = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplTransformToJson(TplTransform instance) =>
    <String, dynamic>{
      't': instance.t,
      'transform': instance.transform,
      'origin': instance.origin?.toJson(),
      'alignment': instance.alignment?.toJson(),
      'adjustLayout': instance.adjustLayout,
      'unconstrained': instance.unconstrained,
      'fit': instance.fit,
      'angle': instance.angle,
      'offset': instance.offset?.toJson(),
      'scale': instance.scale,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
