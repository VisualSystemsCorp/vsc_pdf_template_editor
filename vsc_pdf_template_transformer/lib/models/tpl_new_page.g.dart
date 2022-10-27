// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_new_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplNewPage _$TplNewPageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplNewPage',
      json,
      ($checkedConvert) {
        final val = TplNewPage();
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplNewPageToJson(TplNewPage instance) =>
    <String, dynamic>{
      'className': instance.className,
    };
