// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_pdf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextPdf _$TextPdfFromJson(Map<String, dynamic> json) => TextPdf(
      text: json['text'] as String?,
      style: json['style'] == null
          ? null
          : TextStyle.fromJson(json['style'] as Map<String, dynamic>),
      textAlign: json['textAlign'] as String?,
      textDirection: json['textDirection'] as String?,
      softWrap: json['softWrap'] as bool?,
      tightBounds: json['tightBounds'] as bool?,
      textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble(),
      maxLines: json['maxLines'] as int?,
      overflow: json['overflow'] as String?,
    );

Map<String, dynamic> _$TextPdfToJson(TextPdf instance) => <String, dynamic>{
      'text': instance.text,
      'style': instance.style,
      'textAlign': instance.textAlign,
      'textDirection': instance.textDirection,
      'softWrap': instance.softWrap,
      'tightBounds': instance.tightBounds,
      'textScaleFactor': instance.textScaleFactor,
      'maxLines': instance.maxLines,
      'overflow': instance.overflow,
    };
