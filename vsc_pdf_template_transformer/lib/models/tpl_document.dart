import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';

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

  final bool compress;
  final bool verbose;
  final String? title;
  final String? author;
  final String? creator;
  final String? subject;
  final String? keywords;
  final String? producer;

  factory TplDocument.fromJson(Map<String, dynamic> json) =>
      _$TplDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$TplDocumentToJson(this);

  Document toPdf() {
    return Document(
      compress: compress,
      verbose: verbose,
      title: title,
      author: author,
      creator: creator,
      subject: subject,
      keywords: keywords,
      producer: producer,
    );
  }
}
