// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_paragraph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplParagraph _$TplParagraphFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplParagraph',
      json,
      ($checkedConvert) {
        final val = TplParagraph();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('text', (v) => val.text = v);
        $checkedConvert('textAlign', (v) => val.textAlign = v);
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
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
        return val;
      },
    );

Map<String, dynamic> _$TplParagraphToJson(TplParagraph instance) =>
    <String, dynamic>{
      'className': instance.className,
      'text': instance.text,
      'textAlign': instance.textAlign,
      'style': instance.style?.toJson(),
      'margin': instance.margin?.toJson(),
      'padding': instance.padding?.toJson(),
    };
