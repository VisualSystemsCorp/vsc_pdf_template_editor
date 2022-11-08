// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_text_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTextField _$TplTextFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplTextField',
      json,
      ($checkedConvert) {
        final val = TplTextField();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('name', (v) => val.name = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('flags', (v) => val.flags = v as List<dynamic>?);
        $checkedConvert('date', (v) => val.date = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('backgroundColor', (v) => val.backgroundColor = v);
        $checkedConvert('highlighting', (v) => val.highlighting = v);
        $checkedConvert('maxLength', (v) => val.maxLength = v);
        $checkedConvert('alternateName', (v) => val.alternateName = v);
        $checkedConvert('mappingName', (v) => val.mappingName = v);
        $checkedConvert(
            'fieldFlags', (v) => val.fieldFlags = v as List<dynamic>?);
        $checkedConvert('value', (v) => val.value = v);
        $checkedConvert('defaultValue', (v) => val.defaultValue = v);
        $checkedConvert(
            'textStyle',
            (v) => val.textStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplTextFieldToJson(TplTextField instance) =>
    <String, dynamic>{
      'className': instance.className,
      'name': instance.name,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'width': instance.width,
      'height': instance.height,
      'flags': instance.flags,
      'date': instance.date,
      'color': instance.color,
      'backgroundColor': instance.backgroundColor,
      'highlighting': instance.highlighting,
      'maxLength': instance.maxLength,
      'alternateName': instance.alternateName,
      'mappingName': instance.mappingName,
      'fieldFlags': instance.fieldFlags,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'textStyle': instance.textStyle?.toJson(),
    };
