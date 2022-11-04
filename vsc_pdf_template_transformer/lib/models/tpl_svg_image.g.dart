// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_svg_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplSvgImage _$TplSvgImageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplSvgImage',
      json,
      ($checkedConvert) {
        final val = TplSvgImage();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('svg', (v) => val.svg = v);
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('clip', (v) => val.clip = v);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('colorFilter', (v) => val.colorFilter = v);
        return val;
      },
    );

Map<String, dynamic> _$TplSvgImageToJson(TplSvgImage instance) =>
    <String, dynamic>{
      'className': instance.className,
      'svg': instance.svg,
      'fit': instance.fit,
      'alignment': const AlignmentJsonConverter().toJson(instance.alignment),
      'clip': instance.clip,
      'width': instance.width,
      'height': instance.height,
      'colorFilter': instance.colorFilter,
    };
