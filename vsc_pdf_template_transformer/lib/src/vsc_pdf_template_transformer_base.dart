import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_document.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_multi_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import '../models/tpl_text.dart';
import '../utils/widget_builder.dart';

class Transformer {
  get isReady => true;

  static pw.Document buildPdf(
      Map<String, dynamic> template, Map<String, dynamic> data) {
    final pdf = TplDocument.fromJson(template).toPdf(data);
    for (int i = 0; i < template['children'].length; i++) {
      if (template['children'][i]['className'] == 'TplMultiPage') {
        final List<WidgetBuilder> children = [];
        for (int j = 0; j < template['children'][i]['children'].length; j++) {
          final child = getWidgetBuilder(
              jsonDecode(jsonEncode(template['children'][i]['children'][j])));
          children.add(child);
        }
        pdf.addPage(TplMultiPage(children).toPdf(data));
      } else {
        pdf.addPage(TplPage(getWidgetBuilder(
                jsonDecode(jsonEncode(template['children'][i]['children'][0]))))
            .toPdf(data));
      }
    }
    return pdf;
  }

  static WidgetBuilder getWidgetBuilder(Map<String, dynamic> valueMap) {
    WidgetBuilder result;

    const widgetClassFromJson = {
      'TplText': TplText.fromJson,
      'TplSizedBox': TplSizedBox.fromJson,
      'TplContainer': TplContainer.fromJson,
      'TplColumn': TplColumn.fromJson,
      'TplRow': TplRow.fromJson,
    };

    final fromJson = widgetClassFromJson[valueMap['className']];

    if (fromJson == null) throw Exception('No className or unknown className');
    result = fromJson(valueMap);

    print('------- generated widget $result -----');
    return result;
  }
}
