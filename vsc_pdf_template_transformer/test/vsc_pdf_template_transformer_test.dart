import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart';

dynamic _invoiceData;

void main() {
  setUpAll(() {
    final dataFile = File('test/data/sample_invoice.json');
    _invoiceData = jsonDecode(dataFile.readAsStringSync());

    final outDir = Directory('test/outputs');
    if (!outDir.existsSync()) {
      outDir.createSync();
    }
    final failuresDir = Directory('test/failures');
    if (!failuresDir.existsSync()) {
      failuresDir.createSync();
    }
  });

  for (final testBaseName in [
    'align_footer_checkbox_tpl_test',
    'aspect_ratio_tpl_test',
    'async_default_theme_tpl_test',
    'async_google_font_theme_tpl_test',
    'async_google_font_tpl_test',
    'async_network_image_tpl_test',
    'async_svg_image_tpl_test',
    'barcode_tpl_test',
    'bullet_tpl_test',
    'chart_cartesian_grid_tpl_test',
    'chart_legend_pie_grid_tpl_test',
    'chart_radial_grid_tpl_test',
    'circle_rectangle_polygon_clip_oval_rect_rrect_tpl_test',
    'constrained_box_tpl_test',
    'date_time_formatting_tpl_test',
    'decorated_box_tpl_test',
    'decoration_image_tpl_test',
    'decoration_svg_image_tpl_test',
    'fitted_box_tpl_test',
    'flat_button_tpl_test',
    'flex_tpl_test',
    'flexible_tpl_test',
    'fractional_offset_tpl_test',
    'grid_paper_tpl_test',
    'grid_view_tpl_test',
    'icon_tpl_test',
    'if_tpl_test',
    'image_memory_image_tpl_test',
    'inline_span_tpl_test',
    'invoice_tpl_test',
    'limited_box_tpl_test',
    'line_data_set_tpl_test',
    'linear_gradient_tpl_test',
    'link_tpl_test',
    'list_view_tpl_test',
    'misc_tpl_test',
    'multi_page_header_tpl_test',
    'number_formatting_tpl_test',
    'opacity_tpl_test',
    'page_theme_tpl_test',
    'paragraph_tpl_test',
    'partitions_tpl_test',
    'point_data_set_tpl_test',
    'radial_gradient_tpl_test',
    'raw_image_tpl_test',
    'shape_tpl_test',
    'stack_positioned_tpl_test',
    'svg_image_tpl_test',
    'table_of_content_tpl_test',
    'table_tpl_test',
    'text_field_tpl_test',
    'theme_tpl_test',
    'transform_tpl_test',
    'url_link_tpl_test',
    'vertical_divider_tpl_test',
    'watermark_tpl_test',
    'wrap_tpl_test',
  ]) {
    test('Test $testBaseName', () async {
      final templateFile = File('test/templates/$testBaseName.json');
      final template = jsonDecode(templateFile.readAsStringSync());

      final bytes = await Transformer.buildPdf(template, _invoiceData);

      final outputFileName = 'test/outputs/$testBaseName.pdf';
      final outputFile = File(outputFileName);
      outputFile.writeAsBytesSync(bytes, mode: FileMode.write);
      print('Generated output file $outputFileName');
      await _expectGoldenMatch(testBaseName);
    });
  }
}

Future<void> _expectGoldenMatch(String testBaseName) async {
  final result = await Process.run('test/scripts/compare.sh', [testBaseName]);
  expect(result.exitCode, 0,
      reason: 'Output: \nstdout:\n${result.stdout}\nstderr:\n${result.stderr}');
}
