import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import '../utils/evaluator.dart';

part 'tpl_document.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDocument {
  TplDocument({
    this.compress = true,
    this.verbose = false,
    this.title,
    this.author,
    this.creator,
    this.subject,
    this.keywords,
    this.producer,
  });

  final dynamic compress;
  final dynamic verbose;
  final dynamic title;
  final dynamic author;
  final dynamic creator;
  final dynamic subject;
  final dynamic keywords;
  final dynamic producer;

  factory TplDocument.fromJson(Map<String, dynamic> json) =>
      _$TplDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$TplDocumentToJson(this);

  Document toPdf(Map<String, dynamic> data) {
    return Document(
      compress: evaluateBool(compress, data) ?? true,
      verbose: evaluateBool(verbose, data) ?? false,
      title: evaluateString(title, data).toString(),
      author: evaluateString(author, data).toString(),
      creator: evaluateString(creator, data).toString(),
      subject: evaluateString(subject, data).toString(),
      keywords: evaluateString(keywords, data).toString(),
      producer: evaluateString(producer, data).toString(),
    );
  }
}
