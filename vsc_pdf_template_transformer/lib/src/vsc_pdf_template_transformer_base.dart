import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_center.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_document.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_expanded.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_full_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_header.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_multi_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_new_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_padding.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_placeholder.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_spacer.dart';
import '../models/tpl_text.dart';
import '../utils/widget_builder.dart';

class Transformer {
  static pw.Document buildPdf(
      Map<String, dynamic> template, Map<String, dynamic> data) {
    final tplDocument = TplDocument.fromJson(template);
    final document = tplDocument.toPdf(data);

    final documentChildren = tplDocument.children ?? [];
    for (int i = 0; i < documentChildren.length; i++) {
      final childJson = documentChildren[i];
      if (childJson['className'] == 'TplMultiPage') {
        document.addPage(TplMultiPage.fromJson(childJson).toPdf(data));
      } else if (childJson['className'] == 'TplPage') {
        document.addPage(TplPage.fromJson(childJson).toPdf(data));
      } else {
        throw Exception(
            '${childJson['className']} is not a recognized Page type');
      }
    }
    return document;
  }

  static WidgetBuilder getWidgetBuilder(Map<String, dynamic> valueMap) {
    WidgetBuilder result;

    const widgetClassFromJson = {
      'TplText': TplText.fromJson,
      'TplSizedBox': TplSizedBox.fromJson,
      'TplContainer': TplContainer.fromJson,
      'TplColumn': TplColumn.fromJson,
      'TplRow': TplRow.fromJson,
      'TplHeader': TplHeader.fromJson,
      'TplNewPage': TplNewPage.fromJson,
      'TplSpacer': TplSpacer.fromJson,
      'TplExpanded': TplExpanded.fromJson,
      'TplCenter': TplCenter.fromJson,
      'TplDivider': TplDivider.fromJson,
      'TplFullPage': TplFullPage.fromJson,
      'TplPadding': TplPadding.fromJson,
      'TplPlaceholder': TplPlaceholder.fromJson
    };

    final fromJson = widgetClassFromJson[valueMap['className']];

    if (fromJson == null) throw Exception('No className or unknown className');
    result = fromJson(valueMap);

    print('------- generated widget $result -----');
    return result;
  }
}
