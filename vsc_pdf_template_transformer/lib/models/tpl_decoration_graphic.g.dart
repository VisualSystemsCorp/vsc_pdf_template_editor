// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_decoration_graphic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplDecorationGraphic _$TplDecorationGraphicFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TplDecorationGraphic',
      json,
      ($checkedConvert) {
        final val = TplDecorationGraphic();
        $checkedConvert('decorationData',
            (v) => val.decorationData = v as Map<String, dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplDecorationGraphicToJson(
        TplDecorationGraphic instance) =>
    <String, dynamic>{
      'decorationData': instance.decorationData,
    };
