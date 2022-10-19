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
        final val = TplContainer(
          alignment: $checkedConvert(
              'alignment',
              (v) => v == null
                  ? const TplAlignment()
                  : TplAlignment.fromJson(v as Map<String, dynamic>)),
          padding: $checkedConvert(
              'padding',
              (v) => v == null
                  ? const TplEdgeInsets()
                  : TplEdgeInsets.fromJson(v as Map<String, dynamic>)),
          color: $checkedConvert('color', (v) => v as String?),
          decoration: $checkedConvert(
              'decoration',
              (v) => v == null
                  ? null
                  : TplBoxDecoration.fromJson(v as Map<String, dynamic>)),
          foregroundDecoration: $checkedConvert(
              'foregroundDecoration',
              (v) => v == null
                  ? null
                  : TplBoxDecoration.fromJson(v as Map<String, dynamic>)),
          width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
          height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
          margin: $checkedConvert(
              'margin',
              (v) => v == null
                  ? const TplEdgeInsets()
                  : TplEdgeInsets.fromJson(v as Map<String, dynamic>)),
          child: $checkedConvert(
              'child',
              (v) => const WidgetJsonConverter()
                  .fromJson(v as Map<String, dynamic>?)),
        );
        $checkedConvert('className', (v) => val.className = v as String);
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
      'margin': instance.margin?.toJson(),
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
