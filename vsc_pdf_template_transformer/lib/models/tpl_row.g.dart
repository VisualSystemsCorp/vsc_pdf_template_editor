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
      'children':
          instance.children?.map(const WidgetJsonConverter().toJson).toList(),
    };
