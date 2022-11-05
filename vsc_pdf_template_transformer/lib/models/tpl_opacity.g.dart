// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_opacity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplOpacity _$TplOpacityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplOpacity',
      json,
      ($checkedConvert) {
        final val = TplOpacity();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('opacity', (v) => val.opacity = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplOpacityToJson(TplOpacity instance) =>
    <String, dynamic>{
      'className': instance.className,
      'opacity': instance.opacity,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
