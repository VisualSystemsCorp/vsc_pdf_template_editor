// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplContainer _$TplContainerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplContainer',
      json,
      ($checkedConvert) {
        final val = TplContainer();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = v == null
                ? null
                : TplAlignment.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'foregroundDecoration',
            (v) => val.foregroundDecoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert(
            'constraints',
            (v) => val.constraints = v == null
                ? null
                : TplBoxConstraints.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplContainerToJson(TplContainer instance) =>
    <String, dynamic>{
      'className': instance.className,
      'alignment': instance.alignment?.toJson(),
      'padding': instance.padding?.toJson(),
      'color': instance.color,
      'decoration': instance.decoration?.toJson(),
      'foregroundDecoration': instance.foregroundDecoration?.toJson(),
      'width': instance.width,
      'height': instance.height,
      'constraints': instance.constraints?.toJson(),
      'margin': instance.margin?.toJson(),
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
