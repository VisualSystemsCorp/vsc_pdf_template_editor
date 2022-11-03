// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_vertical_divider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplVerticalDivider _$TplVerticalDividerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplVerticalDivider',
      json,
      ($checkedConvert) {
        final val = TplVerticalDivider();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('thickness', (v) => val.thickness = v);
        $checkedConvert('indent', (v) => val.indent = v);
        $checkedConvert('endIndent', (v) => val.endIndent = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert(
            'borderStyle',
            (v) => val.borderStyle = v == null
                ? null
                : TplBorderStyle.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplVerticalDividerToJson(TplVerticalDivider instance) =>
    <String, dynamic>{
      'className': instance.className,
      'width': instance.width,
      'thickness': instance.thickness,
      'indent': instance.indent,
      'endIndent': instance.endIndent,
      'color': instance.color,
      'borderStyle': instance.borderStyle?.toJson(),
    };
