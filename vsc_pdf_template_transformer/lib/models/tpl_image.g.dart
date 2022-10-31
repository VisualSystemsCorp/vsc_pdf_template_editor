// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplImage _$TplImageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplImage',
      json,
      ($checkedConvert) {
        final val = TplImage(
          $checkedConvert('image',
              (v) => TplMemoryImage.fromJson(v as Map<String, dynamic>)),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('orientation', (v) => val.orientation = v);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('dpi', (v) => val.dpi = v);
        return val;
      },
    );

Map<String, dynamic> _$TplImageToJson(TplImage instance) => <String, dynamic>{
      'className': instance.className,
      'image': instance.image.toJson(),
      'fit': instance.fit,
      'alignment': instance.alignment?.toJson(),
      'orientation': instance.orientation,
      'width': instance.width,
      'height': instance.height,
      'dpi': instance.dpi,
    };
