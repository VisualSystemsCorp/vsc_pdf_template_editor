import 'dart:async';
import 'dart:typed_data';

import 'package:intl/date_symbol_data_local.dart' as intl_date_data;
import 'package:timezone/data/latest.dart' as tz;
import 'package:vsc_pdf_template_transformer/models/tpl_align.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_aspect_ratio.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_bar_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_barcode_widget.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_bullet.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_cartesian_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_center.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_chart.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_chart_legend.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_checkbox.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_circle.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_clip_oval.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_clip_rect.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_clip_rrect.dart';
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
import 'package:vsc_pdf_template_transformer/models/tpl_grid_paper.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_grid_view.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_header.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_limited_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_line_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_listview.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_multi_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_new_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_opacity.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_padding.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_paragraph.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partition.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partitions.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pie_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pie_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_placeholder.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_polygon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_positioned.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radial_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_rectangle.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_rich_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_shape.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_spacer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_stack.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_svg_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_of_content.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_field.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_transform.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_url_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_vertical_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_watermark.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_wrap.dart';

import '../models/tpl_text.dart';
import '../utils/widget_builder.dart';
import 'network/cache.dart';

var _tzInited = false;

class Transformer {
  static Future<Uint8List> buildPdf(
    Map<String, dynamic> template,
    Map<String, dynamic> data, {
    TplBaseCache? buildCache,
  }) async {
    if (!_tzInited) {
      tz.initializeTimeZones();
      await intl_date_data.initializeDateFormatting();
      _tzInited = true;
    }

    buildCache ??= TplMemoryCache();
    return runZoned(
      () async {
        final result = await _buildPdfInZone(template, data);
        return result;
      },
      zoneValues: {
        #buildCache: buildCache,
      },
    )!;
  }

  static Future<Uint8List> _buildPdfInZone(
      Map<String, dynamic> template, Map<String, dynamic> data) async {
    final tplDocument = TplDocument.fromJson(template);
    final document = await tplDocument.toPdf(data);

    final documentChildren = tplDocument.children ?? [];
    for (int i = 0; i < documentChildren.length; i++) {
      final childJson = documentChildren[i];
      if (childJson['t'] == 'MultiPage') {
        await document
            .addPage(await TplMultiPage.fromJson(childJson).toPdf(data));
      } else if (childJson['t'] == 'Page') {
        await document.addPage(await TplPage.fromJson(childJson).toPdf(data));
      } else {
        throw Exception('${childJson['t']} is not a recognized Page type');
      }
    }
    return document.save();
  }

  static WidgetBuilder getWidgetBuilder(Map<String, dynamic> valueMap) {
    WidgetBuilder result;

    const widgetClassFromJson = {
      'Text': TplText.fromJson,
      'SizedBox': TplSizedBox.fromJson,
      'Container': TplContainer.fromJson,
      'Column': TplColumn.fromJson,
      'Row': TplRow.fromJson,
      'Header': TplHeader.fromJson,
      'NewPage': TplNewPage.fromJson,
      'Spacer': TplSpacer.fromJson,
      'Expanded': TplExpanded.fromJson,
      'Center': TplCenter.fromJson,
      'Divider': TplDivider.fromJson,
      'FullPage': TplFullPage.fromJson,
      'Padding': TplPadding.fromJson,
      'Placeholder': TplPlaceholder.fromJson,
      'Align': TplAlign.fromJson,
      'AspectRatio': TplAspectRatio.fromJson,
      'Checkbox': TplCheckbox.fromJson,
      'ConstrainedBox': TplConstrainedBox.fromJson,
      'DecoratedBox': TplDecoratedBox.fromJson,
      'FittedBox': TplFittedBox.fromJson,
      'Flex': TplFlex.fromJson,
      'Flexible': TplFlexible.fromJson,
      'FlatButton': TplFlatButton.fromJson,
      'Footer': TplFooter.fromJson,
      'GridView': TplGridView.fromJson,
      'LimitedBox': TplLimitedBox.fromJson,
      'Image': TplImage.fromJson,
      'SvgImage': TplSvgImage.fromJson,
      'Stack': TplStack.fromJson,
      'Positioned': TplPositioned.fromJson,
      'ListView': TplListView.fromJson,
      'Link': TplLink.fromJson,
      'UrlLink': TplUrlLink.fromJson,
      'Paragraph': TplParagraph.fromJson,
      'VerticalDivider': TplVerticalDivider.fromJson,
      'Watermark': TplWatermark.fromJson,
      'Wrap': TplWrap.fromJson,
      'Table': TplTable.fromJson,
      'Bullet': TplBullet.fromJson,
      'Icon': TplIcon.fromJson,
      'Opacity': TplOpacity.fromJson,
      'Partition': TplPartition.fromJson,
      'Partitions': TplPartitions.fromJson,
      'RichText': TplRichText.fromJson,
      'TableOfContent': TplTableOfContent.fromJson,
      'TextField': TplTextField.fromJson,
      'Chart': TplChart.fromJson,
      'CartesianGrid': TplCartesianGrid.fromJson,
      'PieGrid': TplPieGrid.fromJson,
      'RadialGrid': TplRadialGrid.fromJson,
      'PieDataSet': TplPieDataSet.fromJson,
      'BarDataSet': TplBarDataSet.fromJson,
      'PointDataSet': TplPointDataSet.fromJson,
      'LineDataSet': TplLineDataSet.fromJson,
      'ChartLegend': TplChartLegend.fromJson,
      'Circle': TplCircle.fromJson,
      'ClipOval': TplClipOval.fromJson,
      'ClipRect': TplClipRect.fromJson,
      'ClipRRect': TplClipRRect.fromJson,
      'Rectangle': TplRectangle.fromJson,
      'Polygon': TplPolygon.fromJson,
      'Transform': TplTransform.fromJson,
      'BarcodeWidget': TplBarcodeWidget.fromJson,
      'Shape': TplShape.fromJson,
      'GridPaper': TplGridPaper.fromJson,
      'Theme': TplTheme.fromJson
    };

    final fromJson = widgetClassFromJson[valueMap['t']];

    if (fromJson == null) throw Exception('No type name or unknown type name');
    result = fromJson(valueMap);
    return result;
  }
}
