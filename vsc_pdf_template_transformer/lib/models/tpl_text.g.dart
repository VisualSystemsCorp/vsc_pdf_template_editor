// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplText _$TplTextFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplText',
      json,
      ($checkedConvert) {
        final val = TplText(
          id: $checkedConvert('id', (v) => v as String?),
          text: $checkedConvert(
              'text', (v) => TplString.fromJson(v as Map<String, dynamic>)),
          style: $checkedConvert(
              'style',
              (v) => v == null
                  ? null
                  : TplTextStyle.fromJson(v as Map<String, dynamic>)),
          textAlign: $checkedConvert(
              'textAlign',
              (v) =>
                  $enumDecodeNullable(_$TextAlignEnumMap, v) ?? TextAlign.left),
          textDirection: $checkedConvert(
              'textDirection',
              (v) =>
                  $enumDecodeNullable(_$TextDirectionEnumMap, v) ??
                  TextDirection.ltr),
          softWrap: $checkedConvert('softWrap', (v) => v as bool? ?? true),
          tightBounds:
              $checkedConvert('tightBounds', (v) => v as bool? ?? false),
          textScaleFactor: $checkedConvert(
              'textScaleFactor', (v) => (v as num?)?.toDouble() ?? 1.0),
          maxLines: $checkedConvert('maxLines', (v) => v as int? ?? 1),
          overflow: $checkedConvert(
              'overflow',
              (v) =>
                  $enumDecodeNullable(_$TextOverflowEnumMap, v) ??
                  TextOverflow.clip),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplTextToJson(TplText instance) => <String, dynamic>{
      'className': instance.className,
      'id': instance.id,
      'text': instance.text.toJson(),
      'style': instance.style?.toJson(),
      'textAlign': _$TextAlignEnumMap[instance.textAlign]!,
      'textDirection': _$TextDirectionEnumMap[instance.textDirection]!,
      'softWrap': instance.softWrap,
      'tightBounds': instance.tightBounds,
      'textScaleFactor': instance.textScaleFactor,
      'maxLines': instance.maxLines,
      'overflow': _$TextOverflowEnumMap[instance.overflow]!,
    };

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
};

const _$TextDirectionEnumMap = {
  TextDirection.ltr: 'ltr',
  TextDirection.rtl: 'rtl',
};

const _$TextOverflowEnumMap = {
  TextOverflow.clip: 'clip',
  TextOverflow.visible: 'visible',
  TextOverflow.span: 'span',
};
