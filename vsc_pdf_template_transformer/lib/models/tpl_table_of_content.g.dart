// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_table_of_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTableOfContent _$TplTableOfContentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TableOfContent',
      json,
      ($checkedConvert) {
        final val = TplTableOfContent();
        $checkedConvert('t', (v) => val.t = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplTableOfContentToJson(TplTableOfContent instance) =>
    <String, dynamic>{
      't': instance.t,
    };
