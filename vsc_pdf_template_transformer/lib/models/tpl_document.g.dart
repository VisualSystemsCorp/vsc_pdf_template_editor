// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplDocument _$TplDocumentFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplDocument',
      json,
      ($checkedConvert) {
        final val = TplDocument(
          compress: $checkedConvert('compress', (v) => v as bool? ?? true),
          verbose: $checkedConvert('verbose', (v) => v as bool? ?? false),
          title: $checkedConvert('title', (v) => v as String?),
          author: $checkedConvert('author', (v) => v as String?),
          creator: $checkedConvert('creator', (v) => v as String?),
          subject: $checkedConvert('subject', (v) => v as String?),
          keywords: $checkedConvert('keywords', (v) => v as String?),
          producer: $checkedConvert('producer', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplDocumentToJson(TplDocument instance) =>
    <String, dynamic>{
      'compress': instance.compress,
      'verbose': instance.verbose,
      'title': instance.title,
      'author': instance.author,
      'creator': instance.creator,
      'subject': instance.subject,
      'keywords': instance.keywords,
      'producer': instance.producer,
    };
