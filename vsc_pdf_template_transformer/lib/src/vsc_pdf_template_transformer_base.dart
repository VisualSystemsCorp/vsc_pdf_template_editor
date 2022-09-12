import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/text_pdf.dart';

import '../utils/node.dart';
import '../utils/widget_builder.dart';

class Transformer {
  get isReady => true;

  static pw.Document buildPdf(
      Node<String> treeRoot, Map<String, dynamic> data) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          var valueMap = json.decode(treeRoot.value);
          var className = valueMap['className'];
          print('---- root element is of a type ${className} ---');
          WidgetBuilder? proxy =
              getWidgetBuilder(valueMap); //TplText.fromJson(valueMap);
          return pw.Center(
            child: proxy != null
                ? proxy!.buildWidget()
                : pw.Text('Unsupported Component: ${className}'),
          ); // Center
        }));
    return pdf;
  }

  //TODO: Extend with more types. Mirrors package not available in Flutter project so we can't create an instance of a class by name via reflection
  static WidgetBuilder? getWidgetBuilder(Map<String, dynamic> valueMap) {
    WidgetBuilder? result;

    const widgetClassFromJson = {
      'TplText': TplText.fromJson,
    };

    final fromJson = widgetClassFromJson[valueMap['className']];

    if (fromJson == null) throw Exception("No className or unknown clasName");
    result = fromJson(valueMap);

    print('------- generated widget ${result} -----');
    return result;
  }
}
