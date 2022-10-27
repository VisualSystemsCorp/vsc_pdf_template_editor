// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_divider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplDivider _$TplDividerFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplDivider',
      json,
      ($checkedConvert) {
        final val = TplDivider();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('height', (v) => val.height = v);
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

Map<String, dynamic> _$TplDividerToJson(TplDivider instance) =>
    <String, dynamic>{
      'className': instance.className,
      'height': instance.height,
      'thickness': instance.thickness,
      'indent': instance.indent,
      'endIndent': instance.endIndent,
      'color': instance.color,
      'borderStyle': instance.borderStyle?.toJson(),
    };
