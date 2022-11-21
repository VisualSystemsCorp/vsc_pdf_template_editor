// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_radial_gradient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRadialGradient _$TplRadialGradientFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplRadialGradient',
      json,
      ($checkedConvert) {
        final val = TplRadialGradient();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'center',
            (v) => val.center = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('radius', (v) => val.radius = v);
        $checkedConvert('colors', (v) => val.colors = v as List<dynamic>?);
        $checkedConvert(
            'stops',
            (v) => val.stops = (v as List<dynamic>?)
                ?.map((e) => (e as num).toDouble())
                .toList());
        $checkedConvert('tileMode', (v) => val.tileMode = v);
        $checkedConvert(
            'focal',
            (v) => val.focal = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('focalRadius', (v) => val.focalRadius = v);
        return val;
      },
    );

Map<String, dynamic> _$TplRadialGradientToJson(TplRadialGradient instance) =>
    <String, dynamic>{
      't': instance.t,
      'center': const AlignmentJsonConverter().toJson(instance.center),
      'radius': instance.radius,
      'colors': instance.colors,
      'stops': instance.stops,
      'tileMode': instance.tileMode,
      'focal': const AlignmentJsonConverter().toJson(instance.focal),
      'focalRadius': instance.focalRadius,
    };
