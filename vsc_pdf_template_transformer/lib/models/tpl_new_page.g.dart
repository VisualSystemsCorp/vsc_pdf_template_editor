// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_new_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplNewPage _$TplNewPageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'NewPage',
      json,
      ($checkedConvert) {
        final val = TplNewPage();
        $checkedConvert('t', (v) => val.t = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplNewPageToJson(TplNewPage instance) =>
    <String, dynamic>{
      't': instance.t,
    };
