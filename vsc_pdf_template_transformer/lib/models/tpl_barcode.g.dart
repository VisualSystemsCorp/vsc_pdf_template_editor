// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_barcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBarcode _$TplBarcodeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplBarcode',
      json,
      ($checkedConvert) {
        final val = TplBarcode();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('type', (v) => val.type = v);
        return val;
      },
    );

Map<String, dynamic> _$TplBarcodeToJson(TplBarcode instance) =>
    <String, dynamic>{
      'className': instance.className,
      'type': instance.type,
    };
