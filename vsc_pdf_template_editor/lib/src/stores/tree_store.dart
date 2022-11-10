import 'dart:convert';
import 'dart:typed_data';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/widgets.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_align.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_circle.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_ink.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_polygon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_square.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_text_field.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_url.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_aspect_ratio.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_side.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_constraints.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_center.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_checkbox.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_constrained_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decorated_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_expanded.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fitted_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fixed_axis.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fixed_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flat_button.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flex.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flex_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flexible.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_footer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fraction_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_grid_view.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon_theme_data.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_intrinsic_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_limited_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_linear_gradient.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_page_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partition.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_chart_value.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_positioned.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radial_gradient.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_rich_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_spacer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_span.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_repeater.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_header.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_new_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_full_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_padding.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_placeholder.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_memory_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_raw_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_svg_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decoration_svg_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_stack.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_listview.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_url_link.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_paragraph.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_vertical_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_watermark.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_widget_span.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_wrap.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fractional_offset.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fitted_sizes.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_bullet.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon_data.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_opacity.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partitions.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_of_content.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_field.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_chart.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_cartesian_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pie_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radial_grid.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_bar_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pie_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_line_data_set.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_chart_legend.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_circle.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_clip_oval.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_clip_rect.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_clip_rrect.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:mobx/mobx.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';

part 'tree_store.g.dart';

class TreeStore = TreeStoreModel with _$TreeStore;

abstract class TreeStoreModel with Store {
  TreeStoreModel(
    this._template,
    this._data,
  ) {
    _sortDialogItems();
    _initControllers();
    _buildPdf();
  }

  late final CodeController _templateController;
  late final CodeController _dataController;

  pw.Document _doc = pw.Document();

  @observable
  String buildErrorText = '';

  @observable
  int activeTab = 0;

  @readonly
  Map<String, dynamic> _template;

  @readonly
  Map<String, dynamic> _data;

  @readonly
  Uint8List? _pdfBytes = Uint8List(0);

  Uint8List? get pdfBytes => _pdfBytes;

  CodeController get templateController => _templateController;

  CodeController get dataController => _dataController;

  set setPdfBytes(Uint8List? value) {
    _pdfBytes = value;
  }

  @action
  onInputChanged() {
    try {
      _template = jsonDecode(_templateController.rawText);
      buildErrorText = '';
      _buildPdf();
    } catch (e, s) {
      buildErrorText = '$e \n $s';
      debugPrint('$e\n$s');
    }
  }

  @action
  onDataChanged() {
    _data = jsonDecode(_dataController.rawText);
    _buildPdf();
  }

  @action
  addWidget(Map<String, dynamic> map) {
    try {
      final cursorPos = _templateController.selection.base.offset;
      final newMap = _templateController.text.substring(0, cursorPos) +
          _reformatNewWidget(jsonEncode(map)) +
          _templateController.text.substring(cursorPos);
      _templateController.text = newMap;
      _template = jsonDecode(newMap);
      buildErrorText = '';
      _buildPdf();
    } catch (e, s) {
      buildErrorText = '$e \n $s';
      debugPrint('$e\n$s');
    }
  }

  @action
  reformat(CodeController controller) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(controller.text);
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString
        .split('\n')
        .forEach((dynamic element) => sb.write('\n$element'));
    controller.text = sb.toString();
  }

  @action
  String _reformatNewWidget(String text) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(text);
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString
        .split('\n')
        .forEach((dynamic element) => sb.write('\n$element'));
    text = sb.toString();
    return text;
  }

  onWidgetSelected(String name) {
    Map<String, dynamic> map = {};
    switch (name) {
      case 'Text':
        map = TplText().toJson();
        break;
      case 'Sized Box':
        map = TplSizedBox().toJson();
        break;
      case 'Container':
        map = TplContainer().toJson();
        break;
      case 'Column':
        map = TplColumn().toJson();
        break;
      case 'Row':
        map = TplRow().toJson();
        break;
      case 'Repeater':
        map = TplRepeater().toJson();
        break;
      case 'Header':
        map = TplHeader().toJson();
        break;
      case 'New Page':
        map = TplNewPage().toJson();
        break;
      case 'Spacer':
        map = TplSpacer().toJson();
        break;
      case 'Expanded':
        map = TplExpanded().toJson();
        break;
      case 'Center':
        map = TplCenter().toJson();
        break;
      case 'Divider':
        map = TplDivider().toJson();
        break;
      case 'Full Page':
        map = TplFullPage().toJson();
        break;
      case 'Padding':
        map = TplPadding().toJson();
        break;
      case 'Placeholder':
        map = TplPlaceholder().toJson();
        break;
      case 'Align':
        map = TplAlign().toJson();
        break;
      case 'Aspect Ratio':
        map = TplAspectRatio().toJson();
        break;
      case 'Checkbox':
        map = TplCheckbox().toJson();
        break;
      case 'Constrained Box':
        map = TplConstrainedBox().toJson();
        break;
      case 'Decorated Box':
        map = TplDecoratedBox().toJson();
        break;
      case 'Fitted Box':
        map = TplFittedBox().toJson();
        break;
      case 'Flex':
        map = TplFlex().toJson();
        break;
      case 'Flexible':
        map = TplFlexible().toJson();
        break;
      case 'Flat Button':
        map = TplFlatButton().toJson();
        break;
      case 'Footer':
        map = TplFooter().toJson();
        break;
      case 'Grid View':
        map = TplGridView().toJson();
        break;
      case 'Limited Box':
        map = TplLimitedBox().toJson();
        break;
      case 'Image':
        map = TplImage().toJson();
        break;
      case 'Svg Image':
        map = TplSvgImage().toJson();
        break;
      case 'Stack':
        map = TplStack().toJson();
        break;
      case 'Positioned':
        map = TplPositioned().toJson();
        break;
      case 'List View':
        map = TplListView().toJson();
        break;
      case 'Link':
        map = TplLink().toJson();
        break;
      case 'Url Link':
        map = TplUrlLink().toJson();
        break;
      case 'Paragraph':
        map = TplParagraph().toJson();
        break;
      case 'Vertical Divider':
        map = TplVerticalDivider().toJson();
        break;
      case 'Watermark':
        map = TplWatermark().toJson();
        break;
      case 'Wrap':
        map = TplWrap().toJson();
        break;
      case 'Table':
        map = TplTable().toJson();
        break;
      case 'Bullet':
        map = TplBullet().toJson();
        break;
      case 'Icon':
        map = TplIcon().toJson();
        break;
      case 'Opacity':
        map = TplOpacity().toJson();
        break;
      case 'Partition':
        map = TplPartition().toJson();
        break;
      case 'Partitions':
        map = TplPartitions().toJson();
        break;
      case 'Rich Text':
        map = TplRichText().toJson();
        break;
      case 'Table of Content':
        map = TplTableOfContent().toJson();
        break;
      case 'Text Field':
        map = TplTextField().toJson();
        break;
      case 'Chart':
        map = TplChart().toJson();
        break;
      case 'Cartesian Grid':
        map = TplCartesianGrid().toJson();
        break;
      case 'Pie Grid':
        map = TplPieGrid().toJson();
        break;
      case 'Radial Grid':
        map = TplRadialGrid().toJson();
        break;
      case 'Pie Data Set':
        map = TplPieDataSet().toJson();
        break;
      case 'Bar Data Set':
        map = TplBarDataSet().toJson();
        break;
      case 'Point Data Set':
        map = TplPointDataSet().toJson();
        break;
      case 'Line Data Set':
        map = TplLineDataSet().toJson();
        break;
      case 'Chart Legend':
        map = TplChartLegend().toJson();
        break;
      case 'Circle':
        map = TplCircle().toJson();
        break;
      case 'Clip Oval':
        map = TplClipOval().toJson();
        break;
      case 'Clip Rect':
        map = TplClipRect().toJson();
        break;
      case 'Clip RRect':
        map = TplClipRRect().toJson();
        break;
    }
    addWidget(map);
  }

  onPropertySelected(String name) {
    Map<String, dynamic> map = {};
    switch (name) {
      case 'Alignment':
        map = TplAlignment().toJson();
        break;
      case 'Edge Insets':
        map = TplEdgeInsets().toJson();
        break;
      case 'Box Decoration':
        map = TplBoxDecoration().toJson();
        break;
      case 'Radius':
        map = TplRadius().toJson();
        break;
      case 'Box Border':
        map = TplBoxBorder().toJson();
        break;
      case 'Box Constraints':
        map = TplBoxConstraints().toJson();
        break;
      case 'Border Style':
        map = TplBorderStyle().toJson();
        break;
      case 'Border Radius':
        map = TplBorderRadius().toJson();
        break;
      case 'Border Side':
        map = TplBorderSide().toJson();
        break;
      case 'Text Style':
        map = TplTextStyle().toJson();
        break;
      case 'Page Format':
        map = TplPdfPageFormat().toJson();
        break;
      case 'Decoration Image':
        map = TplDecorationImage().toJson();
        break;
      case 'Decoration Svg Image':
        map = TplDecorationSvgImage().toJson();
        break;
      case 'Table Border':
        map = TplTableBorder().toJson();
        break;
      case 'Table Row':
        map = TplTableRow().toJson();
        break;
      case 'Intrinsic Column Width':
        map = TplIntrinsicColumnWidth().toJson();
        break;
      case 'Fixed Column Width':
        map = TplFixedColumnWidth().toJson();
        break;
      case 'Flex Column Width':
        map = TplFlexColumnWidth().toJson();
        break;
      case 'Fraction Column Width':
        map = TplFractionColumnWidth().toJson();
        break;
      case 'Linear Gradient':
        map = TplLinearGradient().toJson();
        break;
      case 'Radial Gradient':
        map = TplRadialGradient().toJson();
        break;
      case 'Fractional Offset':
        map = TplFractionalOffset().toJson();
        break;
      case 'Fitted Sizes':
        map = TplFittedSizes().toJson();
        break;
      case 'Icon Data':
        map = TplIconData().toJson();
        break;
      case 'Page Theme':
        map = TplPageTheme().toJson();
        break;
      case 'Theme Data':
        map = TplThemeData().toJson();
        break;
      case 'Icon Theme Data':
        map = TplIconThemeData().toJson();
        break;
      case 'Widget Span':
        map = TplWidgetSpan().toJson();
        break;
      case 'Text Span':
        map = TplTextSpan().toJson();
        break;
      case 'Annotation Url':
        map = TplAnnotationUrl().toJson();
        break;
      case 'Annotation Square':
        map = TplAnnotationSquare().toJson();
        break;
      case 'Annotation Circle':
        map = TplAnnotationCircle().toJson();
        break;
      case 'Annotation Polygon':
        map = TplAnnotationPolygon().toJson();
        break;
      case 'Annotation Ink':
        map = TplAnnotationInk().toJson();
        break;
      case 'Annotation Text Field':
        map = TplAnnotationTextField().toJson();
        break;
      case 'Pdf Point':
        map = TplPdfPoint().toJson();
        break;
      case 'Fixed Axis':
        map = TplFixedAxis().toJson();
        break;
      case 'Point Chart Value':
        map = TplPointChartValue().toJson();
        break;
    }
    addWidget(map);
  }

  _savePdf() async {
    setPdfBytes = await _doc.save();
  }

  _buildPdf() async {
    try {
      _doc = transformer.Transformer.buildPdf(_template, _data);
      buildErrorText = '';
      await _savePdf();
    } catch (e, s) {
      buildErrorText = '$e \n $s';
      debugPrint('$e\n$s');
    }
  }

  _sortDialogItems() {
    AppConstants.supportedWidgets.sort((a, b) => a.compareTo(b));
    AppConstants.supportedProperties.sort((a, b) => a.compareTo(b));
  }

  _initControllers() {
    _templateController = CodeController(
      language: json,
      theme: atomOneDarkReasonableTheme,
      text: jsonEncode(_template),
      onChange: (val) => EasyDebounce.debounce(
          '', const Duration(milliseconds: 500), () => onInputChanged()),
      webSpaceFix: false,
    );
    _dataController = CodeController(
      language: json,
      theme: atomOneDarkReasonableTheme,
      text: jsonEncode(_data),
      onChange: (val) => EasyDebounce.debounce(
          '', const Duration(milliseconds: 500), () => onDataChanged()),
      webSpaceFix: false,
    );
  }

  dynamic insertImage(Uint8List file, String name) {
    Map<String, dynamic> map = {};
    final base64Str = base64Encode(file.toList());
    switch (name) {
      case 'Memory Image':
        map = TplMemoryImage("'$base64Str'").toJson();
        break;
      case 'Raw Image':
        map = TplRawImage("'$base64Str'").toJson();
        break;
    }
    addWidget(map);
  }
}
