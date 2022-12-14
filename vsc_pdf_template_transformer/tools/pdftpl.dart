#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;

void main(List<String> arguments) async {
  if (arguments.length != 3) {
    stderr
        .writeln('Usage: pdftpl template-json-file data-json-file output-file');
    exit(1);
  }

  final templateFile = File(arguments[0]);
  final dataFile = File(arguments[1]);
  final result = File(arguments[2]);

  final template = jsonDecode(templateFile.readAsStringSync());

  final data = jsonDecode(dataFile.readAsStringSync());

  final bytes = await transformer.Transformer.buildPdf(template, data);
  result.writeAsBytesSync(bytes, mode: FileMode.write);
  exit(0);
}
