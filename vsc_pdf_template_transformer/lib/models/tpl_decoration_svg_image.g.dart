// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_decoration_svg_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplDecorationSvgImage _$TplDecorationSvgImageFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TplDecorationSvgImage',
      json,
      ($checkedConvert) {
        final val = TplDecorationSvgImage();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('svg', (v) => val.svg = v);
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplDecorationSvgImageToJson(
        TplDecorationSvgImage instance) =>
    <String, dynamic>{
      't': instance.t,
      'svg': instance.svg,
      'fit': instance.fit,
      'alignment': const AlignmentJsonConverter().toJson(instance.alignment),
    };
