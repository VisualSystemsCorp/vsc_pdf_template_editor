// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_checkbox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplCheckbox _$TplCheckboxFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplCheckbox',
      json,
      ($checkedConvert) {
        final val = TplCheckbox();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('value', (v) => val.value = v);
        $checkedConvert('tristate', (v) => val.tristate = v);
        $checkedConvert('activeColor', (v) => val.activeColor = v);
        $checkedConvert('checkColor', (v) => val.checkColor = v);
        $checkedConvert('name', (v) => val.name = v);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplCheckboxToJson(TplCheckbox instance) =>
    <String, dynamic>{
      't': instance.t,
      'value': instance.value,
      'tristate': instance.tristate,
      'activeColor': instance.activeColor,
      'checkColor': instance.checkColor,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'decoration': instance.decoration?.toJson(),
    };
