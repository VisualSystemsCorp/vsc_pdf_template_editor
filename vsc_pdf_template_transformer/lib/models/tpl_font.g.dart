// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_font.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFont _$TplFontFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplFont',
      json,
      ($checkedConvert) {
        final val = TplFont(
          font: $checkedConvert('font', (v) => v ?? 'helvetica'),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplFontToJson(TplFont instance) => <String, dynamic>{
      'font': instance.font,
    };
