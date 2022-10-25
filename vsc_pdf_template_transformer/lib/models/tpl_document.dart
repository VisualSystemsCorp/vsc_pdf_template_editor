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
    this.children,
  });

  String className = 'TplDocument';
  final dynamic compress;
  final dynamic verbose;
  final dynamic title;
  final dynamic author;
  final dynamic creator;
  final dynamic subject;
  final dynamic keywords;
  final dynamic producer;
  final List<dynamic>? children;

  factory TplDocument.fromJson(Map<String, dynamic> json) =>
      _$TplDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$TplDocumentToJson(this);

  Document toPdf(Map<String, dynamic> data) {
    return Document(
      compress: evaluateBool(compress, data) ?? true,
      verbose: evaluateBool(verbose, data) ?? false,
      title: evaluateString(title, data),
      author: evaluateString(author, data),
      creator: evaluateString(creator, data),
      subject: evaluateString(subject, data),
      keywords: evaluateString(keywords, data),
      producer: evaluateString(producer, data),
    );
  }
}
