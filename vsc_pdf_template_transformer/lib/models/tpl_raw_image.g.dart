// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_raw_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRawImage _$TplRawImageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplRawImage',
      json,
      ($checkedConvert) {
        final val = TplRawImage(
          $checkedConvert('imageData', (v) => v),
        );
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('orientation', (v) => val.orientation = v);
        $checkedConvert('dpi', (v) => val.dpi = v);
        return val;
      },
    );

Map<String, dynamic> _$TplRawImageToJson(TplRawImage instance) =>
    <String, dynamic>{
      'imageData': instance.imageData,
      'width': instance.width,
      'height': instance.height,
      'orientation': instance.orientation,
      'dpi': instance.dpi,
    };
