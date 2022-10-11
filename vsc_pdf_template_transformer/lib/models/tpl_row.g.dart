// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRow _$TplRowFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplRow',
      json,
      ($checkedConvert) {
        final val = TplRow(
          id: $checkedConvert('id', (v) => v as String),
          mainAxisAlignment: $checkedConvert(
              'mainAxisAlignment',
              (v) =>
                  $enumDecodeNullable(_$MainAxisAlignmentEnumMap, v) ??
                  MainAxisAlignment.start),
          mainAxisSize: $checkedConvert(
              'mainAxisSize',
              (v) =>
                  $enumDecodeNullable(_$MainAxisSizeEnumMap, v) ??
                  MainAxisSize.max),
          crossAxisAlignment: $checkedConvert(
              'crossAxisAlignment',
              (v) =>
                  $enumDecodeNullable(_$CrossAxisAlignmentEnumMap, v) ??
                  CrossAxisAlignment.center),
          verticalDirection: $checkedConvert(
              'verticalDirection',
              (v) =>
                  $enumDecodeNullable(_$VerticalDirectionEnumMap, v) ??
                  VerticalDirection.down),
          children: $checkedConvert(
              'children',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => const WidgetJsonConverter()
                      .fromJson(e as Map<String, dynamic>?))
                  .toList()),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplRowToJson(TplRow instance) => <String, dynamic>{
      'className': instance.className,
      'id': instance.id,
      'mainAxisAlignment':
          _$MainAxisAlignmentEnumMap[instance.mainAxisAlignment]!,
      'mainAxisSize': _$MainAxisSizeEnumMap[instance.mainAxisSize]!,
      'crossAxisAlignment':
          _$CrossAxisAlignmentEnumMap[instance.crossAxisAlignment]!,
      'verticalDirection':
          _$VerticalDirectionEnumMap[instance.verticalDirection]!,
      'children':
          instance.children?.map(const WidgetJsonConverter().toJson).toList(),
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
