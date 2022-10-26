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
        final val = TplPdfPageFormat();
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('marginTop', (v) => val.marginTop = v);
        $checkedConvert('marginBottom', (v) => val.marginBottom = v);
        $checkedConvert('marginLeft', (v) => val.marginLeft = v);
        $checkedConvert('marginRight', (v) => val.marginRight = v);
        $checkedConvert('marginAll', (v) => val.marginAll = v);
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
