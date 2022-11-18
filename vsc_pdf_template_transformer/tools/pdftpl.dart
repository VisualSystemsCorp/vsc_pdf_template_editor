#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;

/// This is main entry point for command line tool
void main(List<String> arguments) async {
  if (arguments.length != 3) {
    stderr
        .writeln('Usage: pdftpl template-json-file data-json-file output-file');
    exit(1);
  }

  final templateFile = File(arguments[0]);
  final dataFile = File(arguments[1]);
  final result = File(arguments[2]);

  final template = json.decode(templateFile.readAsStringSync());

  final data = json.decode(dataFile.readAsStringSync());

  var document = await transformer.Transformer.buildPdf(template, data);
  final bytes = await document.save();
  result.writeAsBytesSync(bytes, mode: FileMode.write);
  exit(0);
}
