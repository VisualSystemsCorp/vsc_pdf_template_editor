import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import '../models/tpl_text.dart';
import '../utils/widget_builder.dart';

class Transformer {
  get isReady => true;

  static pw.Document buildPdf(
      Map<String, dynamic> template, Map<String, dynamic> data) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          var className = template['className'];
          WidgetBuilder? proxy =
              getWidgetBuilder(jsonDecode(jsonEncode(template)));
          return pw.Center(
            child: proxy != null
                ? proxy.buildWidget(data)
                : pw.Text('Unsupported Component: ${className}'),
          ); // Center
        }));
    return pdf;
  }

  //TODO: Extend with more types. Mirrors package not available in Flutter project so we can't create an instance of a class by name via reflection
  static WidgetBuilder? getWidgetBuilder(Map<String, dynamic> valueMap) {
    WidgetBuilder? result;
    final className = valueMap['className'];
    Function? f;
    switch (className) {
      case 'TplText':
        f = TplText.fromJson;
        break;
      case 'TplSizedBox':
        f = TplSizedBox.fromJson;
        break;
    }
    final widgetClassFromJson = {
      className: f,
    };

    final fromJson = widgetClassFromJson[valueMap['className']];

    if (fromJson == null) throw Exception("No className or unknown className");
    result = fromJson(valueMap);

    print('------- generated widget ${result} -----');
    return result;
  }
}
