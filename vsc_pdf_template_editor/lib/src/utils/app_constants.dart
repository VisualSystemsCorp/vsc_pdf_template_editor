import 'package:vsc_pdf_template_transformer/models/tpl_align.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_circle.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_ink.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_polygon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_square.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_text_field.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_url.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_aspect_ratio.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_bar_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_barcode_widget.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_side.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_constraints.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
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
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_svg_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_expanded.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fitted_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fitted_sizes.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fixed_axis.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fixed_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flat_button.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flex.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flex_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flexible.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_footer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fraction_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fractional_offset.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_full_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_grid_paper.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_grid_view.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_header.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon_data.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon_theme_data.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_if.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_intrinsic_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_limited_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_line_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_linear_gradient.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_listview.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_multi_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_new_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_opacity.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_padding.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_paragraph.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partition.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partitions.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pie_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pie_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_placeholder.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_chart_value.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_polygon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_positioned.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radial_gradient.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radial_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_rectangle.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_repeater.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_rich_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_shape.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_spacer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_stack.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_svg_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_of_content.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_field.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_span.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme_data.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_transform.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_url_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_vertical_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_watermark.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_widget_span.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_wrap.dart';

class AppConstants {
  static Map<String, Map<String, dynamic>> supportedWidgetsMap = {
    'Text': TplText().toJson(),
    'Sized Box': TplSizedBox().toJson(),
    'Container': TplContainer().toJson(),
    'Column': TplColumn().toJson(),
    'Row': TplRow().toJson(),
    'Repeater': TplRepeater().toJson(),
    'If': TplIf().toJson(),
    'Header': TplHeader().toJson(),
    'New Page': TplNewPage().toJson(),
    'Spacer': TplSpacer().toJson(),
    'Expanded': TplExpanded().toJson(),
    'Center': TplCenter().toJson(),
    'Divider': TplDivider().toJson(),
    'Full Page': TplFullPage().toJson(),
    'Padding': TplPadding().toJson(),
    'Placeholder': TplPlaceholder().toJson(),
    'Align': TplAlign().toJson(),
    'Aspect Ratio': TplAspectRatio().toJson(),
    'Checkbox': TplCheckbox().toJson(),
    'Constrained Box': TplConstrainedBox().toJson(),
    'Decorated Box': TplDecoratedBox().toJson(),
    'Fitted Box': TplFittedBox().toJson(),
    'Flex': TplFlex().toJson(),
    'Flexible': TplFlexible().toJson(),
    'Flat Button': TplFlatButton().toJson(),
    'Footer': TplFooter().toJson(),
    'Grid View': TplGridView().toJson(),
    'Limited Box': TplLimitedBox().toJson(),
    'Image': TplImage().toJson(),
    'Svg Image': TplSvgImage().toJson(),
    'Stack': TplStack().toJson(),
    'Positioned': TplPositioned().toJson(),
    'List View': TplListView().toJson(),
    'Link': TplLink().toJson(),
    'Url Link': TplUrlLink().toJson(),
    'Paragraph': TplParagraph().toJson(),
    'Vertical Divider': TplVerticalDivider().toJson(),
    'Watermark': TplWatermark().toJson(),
    'Wrap': TplWrap().toJson(),
    'Table': TplTable().toJson(),
    'Bullet': TplBullet().toJson(),
    'Icon': TplIcon().toJson(),
    'Opacity': TplOpacity().toJson(),
    'Partition': TplPartition().toJson(),
    'Partitions': TplPartitions().toJson(),
    'Rich Text': TplRichText().toJson(),
    'Table of Content': TplTableOfContent().toJson(),
    'Text Field': TplTextField().toJson(),
    'Chart': TplChart().toJson(),
    'Cartesian Grid': TplCartesianGrid().toJson(),
    'Pie Grid': TplPieGrid().toJson(),
    'Radial Grid': TplRadialGrid().toJson(),
    'Pie Data Set': TplPieDataSet().toJson(),
    'Bar Data Set': TplBarDataSet().toJson(),
    'Point Data Set': TplPointDataSet().toJson(),
    'Line Data Set': TplLineDataSet().toJson(),
    'Chart Legend': TplChartLegend().toJson(),
    'Circle': TplCircle().toJson(),
    'Clip Oval': TplClipOval().toJson(),
    'Clip Rect': TplClipRect().toJson(),
    'Clip RRect': TplClipRRect().toJson(),
    'Rectangle': TplRectangle().toJson(),
    'Polygon': TplPolygon().toJson(),
    'Transform': TplTransform().toJson(),
    'Barcode Widget': TplBarcodeWidget().toJson(),
    'Shape': TplShape().toJson(),
    'Grid Paper': TplGridPaper().toJson(),
    'Theme': TplTheme().toJson(),
    'Page': TplPage(null).toJson(),
    'MultiPage': TplMultiPage(null).toJson(),
  };

  static Map<String, Map<String, dynamic>> supportedPropertiesMap = {
    'Alignment': TplAlignment().toJson(),
    'Edge Insets': TplEdgeInsets().toJson(),
    'Box Decoration': TplBoxDecoration().toJson(),
    'Radius': TplRadius().toJson(),
    'Box Border': TplBoxBorder().toJson(),
    'Box Constraints': TplBoxConstraints().toJson(),
    'Border Style': TplBorderStyle().toJson(),
    'Border Radius': TplBorderRadius().toJson(),
    'Border Side': TplBorderSide().toJson(),
    'Text Style': TplTextStyle().toJson(),
    'Page Format': TplPdfPageFormat().toJson(),
    'Decoration Image': TplDecorationImage().toJson(),
    'Decoration Svg Image': TplDecorationSvgImage().toJson(),
    'Table Border': TplTableBorder().toJson(),
    'Table Row': TplTableRow().toJson(),
    'Intrinsic Column Width': TplIntrinsicColumnWidth().toJson(),
    'Fixed Column Width': TplFixedColumnWidth().toJson(),
    'Flex Column Width': TplFlexColumnWidth().toJson(),
    'Fraction Column Width': TplFractionColumnWidth().toJson(),
    'Linear Gradient': TplLinearGradient().toJson(),
    'Radial Gradient': TplRadialGradient().toJson(),
    'Fractional Offset': TplFractionalOffset().toJson(),
    'Fitted Sizes': TplFittedSizes().toJson(),
    'Icon Data': TplIconData().toJson(),
    'Page Theme': TplPageTheme().toJson(),
    'Theme Data': TplThemeData().toJson(),
    'Icon Theme Data': TplIconThemeData().toJson(),
    'Widget Span': TplWidgetSpan().toJson(),
    'Text Span': TplTextSpan().toJson(),
    'Annotation Url': TplAnnotationUrl().toJson(),
    'Annotation Square': TplAnnotationSquare().toJson(),
    'Annotation Circle': TplAnnotationCircle().toJson(),
    'Annotation Polygon': TplAnnotationPolygon().toJson(),
    'Annotation Ink': TplAnnotationInk().toJson(),
    'Annotation Text Field': TplAnnotationTextField().toJson(),
    'Pdf Point': TplPdfPoint().toJson(),
    'Fixed Axis': TplFixedAxis().toJson(),
    'Point Chart Value': TplPointChartValue().toJson(),
  };

  static List<String> supportedImages = [
    'Memory Image',
    'Raw Image',
  ];
}
