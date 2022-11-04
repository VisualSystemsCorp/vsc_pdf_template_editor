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
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'center',
            (v) => val.center = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
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
            (v) => val.focal = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('focalRadius', (v) => val.focalRadius = v);
        return val;
      },
    );

Map<String, dynamic> _$TplRadialGradientToJson(TplRadialGradient instance) =>
    <String, dynamic>{
      'className': instance.className,
      'center': instance.center?.toJson(),
      'radius': instance.radius,
      'colors': instance.colors,
      'stops': instance.stops,
      'tileMode': instance.tileMode,
      'focal': instance.focal?.toJson(),
      'focalRadius': instance.focalRadius,
    };
