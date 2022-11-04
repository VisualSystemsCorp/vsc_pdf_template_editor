import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fixed_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flex_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fraction_column_width.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_intrinsic_column_width.dart';
import '../utils/table_column_width.dart' as tcw;

class TableColumnWidthJsonConverter
    extends JsonConverter<tcw.TableColumnWidth?, Map<String, dynamic>?> {
  const TableColumnWidthJsonConverter();

  @override
  tcw.TableColumnWidth? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['className']) {
        case 'TplIntrinsicColumnWidth':
          return TplIntrinsicColumnWidth.fromJson(json);
        case 'TplFixedColumnWidth':
          return TplFixedColumnWidth.fromJson(json);
        case 'TplFlexColumnWidth':
          return TplFlexColumnWidth.fromJson(json);
        case 'TplFractionColumnWidth':
          return TplFractionColumnWidth.fromJson(json);
      }
      throw Exception(
          'No table column width className or unknown table column width className');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(tcw.TableColumnWidth? object) {
    return object?.toJson();
  }
}
