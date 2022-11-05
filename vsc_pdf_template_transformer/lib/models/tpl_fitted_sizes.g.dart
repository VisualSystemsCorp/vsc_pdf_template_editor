// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_fitted_sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFittedSizes _$TplFittedSizesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFittedSizes',
      json,
      ($checkedConvert) {
        final val = TplFittedSizes();
        $checkedConvert(
            'source',
            (v) => val.source = v == null
                ? null
                : TplPdfPoint.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'destination',
            (v) => val.destination = v == null
                ? null
                : TplPdfPoint.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplFittedSizesToJson(TplFittedSizes instance) =>
    <String, dynamic>{
      'source': instance.source?.toJson(),
      'destination': instance.destination?.toJson(),
    };
