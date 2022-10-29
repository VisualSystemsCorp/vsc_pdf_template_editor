// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_flex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFlex _$TplFlexFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplFlex',
      json,
      ($checkedConvert) {
        final val = TplFlex();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'direction',
            (v) => val.direction =
                $enumDecodeNullable(_$AxisEnumMap, v) ?? Axis.vertical);
        $checkedConvert(
            'mainAxisAlignment',
            (v) => val.mainAxisAlignment =
                $enumDecodeNullable(_$MainAxisAlignmentEnumMap, v) ??
                    MainAxisAlignment.start);
        $checkedConvert(
            'mainAxisSize',
            (v) => val.mainAxisSize =
                $enumDecodeNullable(_$MainAxisSizeEnumMap, v) ??
                    MainAxisSize.max);
        $checkedConvert(
            'crossAxisAlignment',
            (v) => val.crossAxisAlignment =
                $enumDecodeNullable(_$CrossAxisAlignmentEnumMap, v) ??
                    CrossAxisAlignment.center);
        $checkedConvert(
            'verticalDirection',
            (v) => val.verticalDirection =
                $enumDecodeNullable(_$VerticalDirectionEnumMap, v) ??
                    VerticalDirection.down);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplFlexToJson(TplFlex instance) => <String, dynamic>{
      'className': instance.className,
      'direction': _$AxisEnumMap[instance.direction]!,
      'mainAxisAlignment':
          _$MainAxisAlignmentEnumMap[instance.mainAxisAlignment]!,
      'mainAxisSize': _$MainAxisSizeEnumMap[instance.mainAxisSize]!,
      'crossAxisAlignment':
          _$CrossAxisAlignmentEnumMap[instance.crossAxisAlignment]!,
      'verticalDirection':
          _$VerticalDirectionEnumMap[instance.verticalDirection]!,
      'children': instance.children,
    };

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};

const _$MainAxisAlignmentEnumMap = {
  MainAxisAlignment.start: 'start',
  MainAxisAlignment.end: 'end',
  MainAxisAlignment.center: 'center',
  MainAxisAlignment.spaceBetween: 'spaceBetween',
  MainAxisAlignment.spaceAround: 'spaceAround',
  MainAxisAlignment.spaceEvenly: 'spaceEvenly',
};

const _$MainAxisSizeEnumMap = {
  MainAxisSize.min: 'min',
  MainAxisSize.max: 'max',
};

const _$CrossAxisAlignmentEnumMap = {
  CrossAxisAlignment.start: 'start',
  CrossAxisAlignment.end: 'end',
  CrossAxisAlignment.center: 'center',
  CrossAxisAlignment.stretch: 'stretch',
};

const _$VerticalDirectionEnumMap = {
  VerticalDirection.up: 'up',
  VerticalDirection.down: 'down',
};
