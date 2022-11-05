// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_pdf_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPdfPoint _$TplPdfPointFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplPdfPoint',
      json,
      ($checkedConvert) {
        final val = TplPdfPoint();
        $checkedConvert('x', (v) => val.x = v);
        $checkedConvert('y', (v) => val.y = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPdfPointToJson(TplPdfPoint instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
