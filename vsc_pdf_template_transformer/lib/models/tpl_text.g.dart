// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplText _$TplTextFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplText',
      json,
      ($checkedConvert) {
        final val = TplText();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('text', (v) => val.text = v);
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert('textAlign', (v) => val.textAlign = v);
        $checkedConvert('textDirection', (v) => val.textDirection = v);
        $checkedConvert('softWrap', (v) => val.softWrap = v ?? true);
        $checkedConvert('tightBounds', (v) => val.tightBounds = v ?? false);
        $checkedConvert(
            'textScaleFactor', (v) => val.textScaleFactor = v ?? 1.0);
        $checkedConvert('maxLines', (v) => val.maxLines = v ?? 1);
        $checkedConvert('overflow', (v) => val.overflow = v);
        return val;
      },
    );

Map<String, dynamic> _$TplTextToJson(TplText instance) => <String, dynamic>{
      'className': instance.className,
      'text': instance.text,
      'style': instance.style?.toJson(),
      'textAlign': instance.textAlign,
      'textDirection': instance.textDirection,
      'softWrap': instance.softWrap,
      'tightBounds': instance.tightBounds,
      'textScaleFactor': instance.textScaleFactor,
      'maxLines': instance.maxLines,
      'overflow': instance.overflow,
    };
