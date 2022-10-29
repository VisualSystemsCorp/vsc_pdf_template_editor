// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_align.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAlign _$TplAlignFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplAlign',
      json,
      ($checkedConvert) {
        final val = TplAlign();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert('widthFactor', (v) => val.widthFactor = v);
        $checkedConvert('heightFactor', (v) => val.heightFactor = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplAlignToJson(TplAlign instance) => <String, dynamic>{
      'className': instance.className,
      'alignment': instance.alignment?.toJson(),
      'widthFactor': instance.widthFactor,
      'heightFactor': instance.heightFactor,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
