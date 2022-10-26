// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplHeader _$TplHeaderFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplHeader',
      json,
      ($checkedConvert) {
        final val = TplHeader();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('title', (v) => val.title = v);
        $checkedConvert('text', (v) => val.text = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('level', (v) => val.level = v);
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('outlineStyle', (v) => val.outlineStyle = v);
        return val;
      },
    );

Map<String, dynamic> _$TplHeaderToJson(TplHeader instance) => <String, dynamic>{
      'className': instance.className,
      'title': instance.title,
      'text': instance.text,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'level': instance.level,
      'decoration': instance.decoration?.toJson(),
      'margin': instance.margin?.toJson(),
      'padding': instance.padding?.toJson(),
      'style': instance.style?.toJson(),
      'color': instance.color,
      'outlineStyle': instance.outlineStyle,
    };
