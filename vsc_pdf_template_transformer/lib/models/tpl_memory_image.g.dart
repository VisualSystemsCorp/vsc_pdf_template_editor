// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_memory_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplMemoryImage _$TplMemoryImageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplMemoryImage',
      json,
      ($checkedConvert) {
        final val = TplMemoryImage(
          $checkedConvert('imageData', (v) => v),
        );
        $checkedConvert('orientation', (v) => val.orientation = v);
        $checkedConvert('dpi', (v) => val.dpi = v);
        return val;
      },
    );

Map<String, dynamic> _$TplMemoryImageToJson(TplMemoryImage instance) =>
    <String, dynamic>{
      'imageData': instance.imageData,
      'orientation': instance.orientation,
      'dpi': instance.dpi,
    };
