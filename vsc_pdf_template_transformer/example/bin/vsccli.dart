import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import '../../lib/vsc_pdf_template_transformer.dart' as transformer;//TODO: replace source import with lib import
import '../../lib/utils/node.dart';//TODO: replace source import with lib import

/**
 * This is main entry point for command line tool
 */
void main(List<String> arguments) {

  var widgetsData = Map<String, dynamic>();//read data from arguments[1]

  final tree = File(arguments[0]);
  final data = File(arguments[1]);
  final result = File(arguments[2]);

  var widgetsTree = new Node<String>(tree.readAsStringSync(), []);//read here tree from arguments[0] - for now single node

  widgetsData = Map<String, dynamic>.from(json.decode(data.readAsStringSync()) as Map<dynamic, dynamic>);
  
  var document = transformer.Transformer.buildPdf(widgetsTree, widgetsData);
  Future<Uint8List> bytes = document.save();
  
  bytes.then((value) => result.writeAsBytesSync(value, mode: FileMode.append)).whenComplete(() => print('ccomplete OK'))
      .onError((error, stackTrace) => print(error));

}
