// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_fitted_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFittedBox _$TplFittedBoxFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFittedBox',
      json,
      ($checkedConvert) {
        final val = TplFittedBox();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplFittedBoxToJson(TplFittedBox instance) =>
    <String, dynamic>{
      'className': instance.className,
      'fit': instance.fit,
      'alignment': instance.alignment?.toJson(),
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
