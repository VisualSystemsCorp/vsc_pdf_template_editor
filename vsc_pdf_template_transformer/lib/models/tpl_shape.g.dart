// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplShape _$TplShapeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplShape',
      json,
      ($checkedConvert) {
        final val = TplShape();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('shape', (v) => val.shape = v);
        $checkedConvert('fillColor', (v) => val.fillColor = v);
        $checkedConvert('strokeColor', (v) => val.strokeColor = v);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('fit', (v) => val.fit = v);
        return val;
      },
    );

Map<String, dynamic> _$TplShapeToJson(TplShape instance) => <String, dynamic>{
      'className': instance.className,
      'shape': instance.shape,
      'fillColor': instance.fillColor,
      'strokeColor': instance.strokeColor,
      'width': instance.width,
      'height': instance.height,
      'fit': instance.fit,
    };
