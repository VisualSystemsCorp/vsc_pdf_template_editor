import 'dart:convert';
import 'package:expressions/expressions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../models/tpl_text.dart';
import '../utils/widget_builder.dart';

class Transformer {
  get isReady => true;

  static pw.Document buildPdf(Map<String, dynamic> template) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          var className = template['className'];
          WidgetBuilder? proxy = getWidgetBuilder(
              jsonDecode(jsonEncode(template))); //TplText.fromJson(valueMap);
          return pw.Center(
            child: proxy != null
                ? proxy.buildWidget()
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

    if (fromJson == null) throw Exception("No className or unknown className");
    result = fromJson(valueMap);

    print('------- generated widget ${result} -----');
    return result;
  }

  static String? evaluateInput(String text, Map<String, dynamic> data) {
    final evaluator = const ExpressionEvaluator();
    dynamic res;
    final context = data;

    res = evaluator.eval(Expression.parse(text), context);
    return res?.toString();
  }
}
