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
            (v) => val.alignment = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('clip', (v) => val.clip = v);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('dpi', (v) => val.dpi = v);
        $checkedConvert('colorFilter', (v) => val.colorFilter = v);
        return val;
      },
    );

Map<String, dynamic> _$TplSvgImageToJson(TplSvgImage instance) =>
    <String, dynamic>{
      'className': instance.className,
      'svg': instance.svg,
      'fit': instance.fit,
      'alignment': instance.alignment?.toJson(),
      'clip': instance.clip,
      'width': instance.width,
      'height': instance.height,
      'dpi': instance.dpi,
      'colorFilter': instance.colorFilter,
    };
