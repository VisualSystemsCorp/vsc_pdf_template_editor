// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_linear_gradient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplLinearGradient _$TplLinearGradientFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplLinearGradient',
      json,
      ($checkedConvert) {
        final val = TplLinearGradient();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'begin',
            (v) => val.begin = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'end',
            (v) => val.end = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('colors', (v) => val.colors = v as List<dynamic>?);
        $checkedConvert(
            'stops',
            (v) => val.stops = (v as List<dynamic>?)
                ?.map((e) => (e as num).toDouble())
                .toList());
        $checkedConvert('tileMode', (v) => val.tileMode = v);
        return val;
      },
    );

Map<String, dynamic> _$TplLinearGradientToJson(TplLinearGradient instance) =>
    <String, dynamic>{
      'className': instance.className,
      'begin': instance.begin?.toJson(),
      'end': instance.end?.toJson(),
      'colors': instance.colors,
      'stops': instance.stops,
      'tileMode': instance.tileMode,
    };
