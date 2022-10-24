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
          compress: $checkedConvert('compress', (v) => v ?? true),
          verbose: $checkedConvert('verbose', (v) => v ?? false),
          title: $checkedConvert('title', (v) => v),
          author: $checkedConvert('author', (v) => v),
          creator: $checkedConvert('creator', (v) => v),
          subject: $checkedConvert('subject', (v) => v),
          keywords: $checkedConvert('keywords', (v) => v),
          producer: $checkedConvert('producer', (v) => v),
          children: $checkedConvert('children', (v) => v as List<dynamic>?),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplDocumentToJson(TplDocument instance) =>
    <String, dynamic>{
      'className': instance.className,
      'compress': instance.compress,
      'verbose': instance.verbose,
      'title': instance.title,
      'author': instance.author,
      'creator': instance.creator,
      'subject': instance.subject,
      'keywords': instance.keywords,
      'producer': instance.producer,
      'children': instance.children,
    };
