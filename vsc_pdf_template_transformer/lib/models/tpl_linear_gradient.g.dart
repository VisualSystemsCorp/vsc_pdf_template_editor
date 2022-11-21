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
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'begin',
            (v) => val.begin = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'end',
            (v) => val.end = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
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
      't': instance.t,
      'begin': const AlignmentJsonConverter().toJson(instance.begin),
      'end': const AlignmentJsonConverter().toJson(instance.end),
      'colors': instance.colors,
      'stops': instance.stops,
      'tileMode': instance.tileMode,
    };
