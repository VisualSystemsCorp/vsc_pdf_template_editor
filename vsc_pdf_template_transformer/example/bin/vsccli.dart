import 'dart:io';
import 'dart:convert';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;

/// This is main entry point for command line tool
void main(List<String> arguments) async {
  var data = <String, dynamic>{}; //read data from arguments[1]

  final tree = File(arguments[0]);
  final dataFile = File(arguments[1]);
  final result = File(arguments[2]);

  var template = transformer.Node<String>(tree.readAsStringSync(),
      []); //read here tree from arguments[0] - for now single node

  data = Map<String, dynamic>.from(
      json.decode(dataFile.readAsStringSync()) as Map<dynamic, dynamic>);

  var document = transformer.Transformer.buildPdf({}, {});
  print('---- obtained document: ${document.document.documentID} ---');
  final bytes = await document.save();
  print('---- obtained bytes: $bytes ---');
  result.writeAsBytesSync(bytes, mode: FileMode.write);
}
