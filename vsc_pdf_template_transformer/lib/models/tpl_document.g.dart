// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplDocument _$TplDocumentFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplDocument',
      json,
      ($checkedConvert) {
        final val = TplDocument();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'variables',
            (v) => val.variables = (v as List<dynamic>?)
                    ?.map((e) => VariableInitialization.fromJson(
                        e as Map<String, dynamic>))
                    .toList() ??
                []);
        $checkedConvert('pageMode', (v) => val.pageMode = v);
        $checkedConvert('compress', (v) => val.compress = v);
        $checkedConvert('verbose', (v) => val.verbose = v);
        $checkedConvert('title', (v) => val.title = v);
        $checkedConvert('author', (v) => val.author = v);
        $checkedConvert('creator', (v) => val.creator = v);
        $checkedConvert('subject', (v) => val.subject = v);
        $checkedConvert('keywords', (v) => val.keywords = v);
        $checkedConvert('producer', (v) => val.producer = v);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplDocumentToJson(TplDocument instance) =>
    <String, dynamic>{
      'className': instance.className,
      'variables': instance.variables.map((e) => e.toJson()).toList(),
      'pageMode': instance.pageMode,
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

VariableInitialization _$VariableInitializationFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'VariableInitialization',
      json,
      ($checkedConvert) {
        final val = VariableInitialization();
        $checkedConvert('variable', (v) => val.variable = v as String?);
        $checkedConvert('expression', (v) => val.expression = v);
        return val;
      },
    );

Map<String, dynamic> _$VariableInitializationToJson(
        VariableInitialization instance) =>
    <String, dynamic>{
      'variable': instance.variable,
      'expression': instance.expression,
    };
