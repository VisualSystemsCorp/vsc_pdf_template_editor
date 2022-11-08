// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_pdf_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPdfDocument _$TplPdfDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPdfDocument',
      json,
      ($checkedConvert) {
        final val = TplPdfDocument();
        $checkedConvert('pageMode', (v) => val.pageMode = v);
        $checkedConvert('compress', (v) => val.compress = v);
        $checkedConvert('verbose', (v) => val.verbose = v);
        $checkedConvert('version', (v) => val.version = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPdfDocumentToJson(TplPdfDocument instance) =>
    <String, dynamic>{
      'pageMode': instance.pageMode,
      'compress': instance.compress,
      'verbose': instance.verbose,
      'version': instance.version,
    };
