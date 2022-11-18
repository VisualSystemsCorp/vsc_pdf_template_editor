import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:vsc_pdf_template_transformer/utils/google_fonts.dart';

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
        'networkImage': (url) => networkImage(url),
        'googleFont': (fontName) async {
          final googleFontFunction = googleFonts[fontName];
          if (googleFontFunction == null) {
            throw Exception('Unrecognized font name $fontName');
          }
          return googleFontFunction();
        },
        'defaultTheme': () => _defaultTheme(),
      });

      // Await the result, if necessary.
      while (result is Future) {
        result = await result;
      }

      data[r'$' + varName] = result;
    }
  }

  Future<ThemeData> _defaultTheme() async {
    // Do NOT use pdfDefaultTheme() because it sets a static builder which can affect later template
    // transformations.
    final base = await PdfGoogleFonts.openSansRegular();
    final bold = await PdfGoogleFonts.openSansBold();
    final italic = await PdfGoogleFonts.openSansItalic();
    final boldItalic = await PdfGoogleFonts.openSansBoldItalic();
    final emoji = await PdfGoogleFonts.notoColorEmoji();
    final icons = await PdfGoogleFonts.materialIcons();

    return ThemeData.withFont(
      base: base,
      bold: bold,
      italic: italic,
      boldItalic: boldItalic,
      icons: icons,
      fontFallback: [emoji, base],
    );
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
