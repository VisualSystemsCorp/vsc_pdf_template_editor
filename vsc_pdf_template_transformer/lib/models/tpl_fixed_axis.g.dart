// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_fixed_axis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFixedAxis _$TplFixedAxisFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFixedAxis',
      json,
      ($checkedConvert) {
        final val = TplFixedAxis();
        $checkedConvert('values', (v) => val.values = v as List<dynamic>?);
        $checkedConvert(
            'textStyle',
            (v) => val.textStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert('margin', (v) => val.margin = v);
        $checkedConvert('marginStart', (v) => val.marginStart = v);
        $checkedConvert('marginEnd', (v) => val.marginEnd = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('divisions', (v) => val.divisions = v);
        $checkedConvert('divisionsWidth', (v) => val.divisionsWidth = v);
        $checkedConvert('divisionsColor', (v) => val.divisionsColor = v);
        $checkedConvert('divisionsDashed', (v) => val.divisionsDashed = v);
        $checkedConvert('ticks', (v) => val.ticks = v);
        $checkedConvert('axisTick', (v) => val.axisTick = v);
        $checkedConvert('angle', (v) => val.angle = v);
        return val;
      },
    );

Map<String, dynamic> _$TplFixedAxisToJson(TplFixedAxis instance) =>
    <String, dynamic>{
      'values': instance.values,
      'textStyle': instance.textStyle?.toJson(),
      'margin': instance.margin,
      'marginStart': instance.marginStart,
      'marginEnd': instance.marginEnd,
      'color': instance.color,
      'width': instance.width,
      'divisions': instance.divisions,
      'divisionsWidth': instance.divisionsWidth,
      'divisionsColor': instance.divisionsColor,
      'divisionsDashed': instance.divisionsDashed,
      'ticks': instance.ticks,
      'axisTick': instance.axisTick,
      'angle': instance.angle,
    };
