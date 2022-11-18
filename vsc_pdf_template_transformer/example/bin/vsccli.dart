import 'dart:convert';
import 'dart:io';

import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;

/// This is main entry point for command line tool
void main(List<String> arguments) async {
  final templateFile = File(arguments[0]);
  final dataFile = File(arguments[1]);
  final result = File(arguments[2]);

  final template = json.decode(templateFile.readAsStringSync());

  final data = json.decode(dataFile.readAsStringSync());

  var document = await transformer.Transformer.buildPdf(template, data);
  print('---- obtained document: ${document.document.documentID} ---');
  final bytes = await document.save();
  print('---- obtained bytes: $bytes ---');
  result.writeAsBytesSync(bytes, mode: FileMode.write);
}
