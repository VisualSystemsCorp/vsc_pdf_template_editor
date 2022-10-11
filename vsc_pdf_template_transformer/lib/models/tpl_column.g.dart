// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplColumn _$TplColumnFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplColumn',
      json,
      ($checkedConvert) {
        final val = TplColumn(
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

Map<String, dynamic> _$TplColumnToJson(TplColumn instance) => <String, dynamic>{
      'className': instance.className,
      'id': instance.id,
      'children':
          instance.children?.map(const WidgetJsonConverter().toJson).toList(),
    };
