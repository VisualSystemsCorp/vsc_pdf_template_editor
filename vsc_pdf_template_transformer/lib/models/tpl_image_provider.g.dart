// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_image_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplImageProvider _$TplImageProviderFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplImageProvider',
      json,
      ($checkedConvert) {
        final val = TplImageProvider(
          $checkedConvert('providerData', (v) => v as Map<String, dynamic>),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplImageProviderToJson(TplImageProvider instance) =>
    <String, dynamic>{
      'providerData': instance.providerData,
    };
