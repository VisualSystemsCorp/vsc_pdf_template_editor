// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_rich_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRichText _$TplRichTextFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplRichText',
      json,
      ($checkedConvert) {
        final val = TplRichText();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'text',
            (v) => val.text = const InlineSpanJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('textAlign', (v) => val.textAlign = v);
        $checkedConvert('textDirection', (v) => val.textDirection = v);
        $checkedConvert('softWrap', (v) => val.softWrap = v);
        $checkedConvert('tightBounds', (v) => val.tightBounds = v);
        $checkedConvert('textScaleFactor', (v) => val.textScaleFactor = v);
        $checkedConvert('maxLines', (v) => val.maxLines = v);
        $checkedConvert('overflow', (v) => val.overflow = v);
        return val;
      },
    );

Map<String, dynamic> _$TplRichTextToJson(TplRichText instance) =>
    <String, dynamic>{
      'className': instance.className,
      'text': const InlineSpanJsonConverter().toJson(instance.text),
      'textAlign': instance.textAlign,
      'textDirection': instance.textDirection,
      'softWrap': instance.softWrap,
      'tightBounds': instance.tightBounds,
      'textScaleFactor': instance.textScaleFactor,
      'maxLines': instance.maxLines,
      'overflow': instance.overflow,
    };
