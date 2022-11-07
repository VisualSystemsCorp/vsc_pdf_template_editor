// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_text_span.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTextSpan _$TplTextSpanFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplTextSpan',
      json,
      ($checkedConvert) {
        final val = TplTextSpan();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'children',
            (v) => val.children = (v as List<dynamic>?)
                ?.map((e) => const InlineSpanJsonConverter()
                    .fromJson(e as Map<String, dynamic>?))
                .toList());
        $checkedConvert('text', (v) => val.text = v);
        $checkedConvert('baseline', (v) => val.baseline = v);
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplTextSpanToJson(TplTextSpan instance) =>
    <String, dynamic>{
      'className': instance.className,
      'children': instance.children
          ?.map(const InlineSpanJsonConverter().toJson)
          .toList(),
      'text': instance.text,
      'baseline': instance.baseline,
      'style': instance.style?.toJson(),
    };
