// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_table_of_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTableOfContent _$TplTableOfContentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplTableOfContent',
      json,
      ($checkedConvert) {
        final val = TplTableOfContent();
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplTableOfContentToJson(TplTableOfContent instance) =>
    <String, dynamic>{
      'className': instance.className,
    };
