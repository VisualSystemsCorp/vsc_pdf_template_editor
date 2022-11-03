// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_decoration_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplDecorationImage _$TplDecorationImageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplDecorationImage',
      json,
      ($checkedConvert) {
        final val = TplDecorationImage();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'image',
            (v) => val.image = const ImageProviderJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('dpi', (v) => val.dpi = v);
        return val;
      },
    );

Map<String, dynamic> _$TplDecorationImageToJson(TplDecorationImage instance) =>
    <String, dynamic>{
      'className': instance.className,
      'image': const ImageProviderJsonConverter().toJson(instance.image),
      'fit': instance.fit,
      'alignment': instance.alignment?.toJson(),
      'dpi': instance.dpi,
    };
