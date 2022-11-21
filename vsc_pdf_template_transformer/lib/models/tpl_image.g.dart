// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplImage _$TplImageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplImage',
      json,
      ($checkedConvert) {
        final val = TplImage();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('image', (v) => val.image = v);
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('dpi', (v) => val.dpi = v);
        return val;
      },
    );

Map<String, dynamic> _$TplImageToJson(TplImage instance) => <String, dynamic>{
      't': instance.t,
      'image': instance.image,
      'fit': instance.fit,
      'alignment': const AlignmentJsonConverter().toJson(instance.alignment),
      'width': instance.width,
      'height': instance.height,
      'dpi': instance.dpi,
    };
