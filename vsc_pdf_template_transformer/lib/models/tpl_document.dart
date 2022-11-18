import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/src/fonts/gfonts.dart';
import 'package:vsc_pdf_template_transformer/src/network/cache.dart';

import '../utils/evaluator.dart';

part 'tpl_document.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDocument {
  TplDocument();

  String className = 'TplDocument';

  @JsonKey(defaultValue: [])
  List<VariableInitialization> variables = [];

  dynamic pageMode;
  dynamic compress;
  dynamic verbose;
  dynamic title;
  dynamic author;
  dynamic creator;
  dynamic subject;
  dynamic keywords;
  dynamic producer;
  List<dynamic>? children;

  factory TplDocument.fromJson(Map<String, dynamic> json) =>
      _$TplDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$TplDocumentToJson(this);

  Future<Document> toPdf(Map<String, dynamic> data) async {
    await _initializeVariables(data);
    return Document(
      pageMode: evaluatePdfPageMode(pageMode, data) ?? PdfPageMode.none,
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

  /// Initializes the given variables into [data].  A variable expression may return a Future, in
  /// which case it is awaited to get its final value.
  /// Variables may be referenced in later expressions with the expression syntax `data.$varName`.
  Future<void> _initializeVariables(Map<String, dynamic> data) async {
    for (final varInit in variables) {
      final varName = varInit.variable;
      if (varName == null) {
        throw Exception('variableName was null in variables');
      }

      var result = evaluateDynamic(varInit.expression, data, addlContext: {
        'downloadImage': (url) => downloadImage(url),
        'downloadUtf8String': (url) => downloadUtf8String(url),
        'getGoogleFont': (fontName) async {
          final googleFontFunction = googleFonts[fontName];
          if (googleFontFunction == null) {
            throw Exception('Unrecognized font name $fontName');
          }
          return googleFontFunction();
        },
        'defaultTheme': () => defaultTheme(),
        'getThemeFromGoogleFont': (fontFamilyName) async {
          final themeFunction = googleFontThemes[fontFamilyName];
          if (themeFunction == null) {
            throw Exception(
                'Unrecognized theme font family name $fontFamilyName');
          }
          return themeFunction();
        },
      });

      // Await the result, if necessary.
      while (result is Future) {
        result = await result;
      }

      data[r'$' + varName] = result;
    }
  }
}

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VariableInitialization {
  VariableInitialization();

  factory VariableInitialization.fromJson(Map<String, dynamic> json) =>
      _$VariableInitializationFromJson(json);

  String? variable;
  dynamic expression;

  Map<String, dynamic> toJson() => _$VariableInitializationToJson(this);
}
