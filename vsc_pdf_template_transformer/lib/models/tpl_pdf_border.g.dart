// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_pdf_border.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPdfBorder _$TplPdfBorderFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPdfBorder',
      json,
      ($checkedConvert) {
        final val = TplPdfBorder();
        $checkedConvert(
            'pdfDocument',
            (v) => val.pdfDocument = v == null
                ? null
                : TplPdfDocument.fromJson(v as Map<String, dynamic>));
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('style', (v) => val.style = v);
        $checkedConvert('dash', (v) => val.dash = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplPdfBorderToJson(TplPdfBorder instance) =>
    <String, dynamic>{
      'pdfDocument': instance.pdfDocument?.toJson(),
      'width': instance.width,
      'style': instance.style,
      'dash': instance.dash,
    };
