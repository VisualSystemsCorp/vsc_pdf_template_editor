// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_pdf_page_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPdfPageFormat _$TplPdfPageFormatFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPdfPageFormat',
      json,
      ($checkedConvert) {
        final val = TplPdfPageFormat(
          width: $checkedConvert('width', (v) => v ?? 0),
          height: $checkedConvert('height', (v) => v ?? 0),
          marginTop: $checkedConvert('marginTop', (v) => v ?? 0),
          marginBottom: $checkedConvert('marginBottom', (v) => v ?? 0),
          marginLeft: $checkedConvert('marginLeft', (v) => v ?? 0),
          marginRight: $checkedConvert('marginRight', (v) => v ?? 0),
          marginAll: $checkedConvert('marginAll', (v) => v),
        );
        $checkedConvert('format', (v) => val.format = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPdfPageFormatToJson(TplPdfPageFormat instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'marginTop': instance.marginTop,
      'marginBottom': instance.marginBottom,
      'marginLeft': instance.marginLeft,
      'marginRight': instance.marginRight,
      'marginAll': instance.marginAll,
      'format': instance.format,
    };
