import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_align.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_aspect_ratio.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_bullet.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_center.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_checkbox.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_constrained_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decorated_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_document.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_expanded.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fitted_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flat_button.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flex.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flexible.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_footer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_full_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_grid_view.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_header.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_limited_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_listview.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_multi_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_new_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_opacity.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_padding.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_paragraph.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_placeholder.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_positioned.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_spacer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_stack.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_svg_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_url_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_vertical_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_watermark.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_wrap.dart';
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
      'TplPlaceholder': TplPlaceholder.fromJson,
      'TplAlign': TplAlign.fromJson,
      'TplAspectRatio': TplAspectRatio.fromJson,
      'TplCheckbox': TplCheckbox.fromJson,
      'TplConstrainedBox': TplConstrainedBox.fromJson,
      'TplDecoratedBox': TplDecoratedBox.fromJson,
      'TplFittedBox': TplFittedBox.fromJson,
      'TplFlex': TplFlex.fromJson,
      'TplFlexible': TplFlexible.fromJson,
      'TplFlatButton': TplFlatButton.fromJson,
      'TplFooter': TplFooter.fromJson,
      'TplGridView': TplGridView.fromJson,
      'TplLimitedBox': TplLimitedBox.fromJson,
      'TplImage': TplImage.fromJson,
      'TplSvgImage': TplSvgImage.fromJson,
      'TplStack': TplStack.fromJson,
      'TplPositioned': TplPositioned.fromJson,
      'TplListView': TplListView.fromJson,
      'TplLink': TplLink.fromJson,
      'TplUrlLink': TplUrlLink.fromJson,
      'TplParagraph': TplParagraph.fromJson,
      'TplVerticalDivider': TplVerticalDivider.fromJson,
      'TplWatermark': TplWatermark.fromJson,
      'TplWrap': TplWrap.fromJson,
      'TplTable': TplTable.fromJson,
      'TplBullet': TplBullet.fromJson,
      'TplIcon': TplIcon.fromJson,
      'TplOpacity': TplOpacity.fromJson
    };

    final fromJson = widgetClassFromJson[valueMap['className']];

    if (fromJson == null) throw Exception('No className or unknown className');
    result = fromJson(valueMap);

    print('------- generated widget $result -----');
    return result;
  }
}
