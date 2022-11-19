import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:vsc_pdf_template_transformer/src/async_pdf_widgets/async_document.dart';
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

  Future<AsyncDocument> toPdf(Map<String, dynamic> data) async {
    await _initializeVariables(data);
    return AsyncDocument(
      pageMode: await evaluatePdfPageMode(pageMode, data) ?? PdfPageMode.none,
      compress: await await evaluateBool(compress, data) ?? true,
      verbose: await await evaluateBool(verbose, data) ?? false,
      title: await await evaluateString(title, data),
      author: await await evaluateString(author, data),
      creator: await await evaluateString(creator, data),
      subject: await await evaluateString(subject, data),
      keywords: await await evaluateString(keywords, data),
      producer: await await evaluateString(producer, data),
    );
  }

  /// Initializes the given variables into [data].
  /// Variables may be referenced in later expressions with the expression syntax `data.$varName`.
  Future<void> _initializeVariables(Map<String, dynamic> data) async {
    for (final varInit in variables) {
      final varName = varInit.variable;
      if (varName == null) {
        throw Exception('variableName was null in variables');
      }

      var result =
          await evaluateDynamic(varInit.expression, data, addlContext: {
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
