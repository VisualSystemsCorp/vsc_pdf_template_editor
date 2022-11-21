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
      switch (json['t']) {
        case 'IntrinsicColumnWidth':
          return TplIntrinsicColumnWidth.fromJson(json);
        case 'FixedColumnWidth':
          return TplFixedColumnWidth.fromJson(json);
        case 'FlexColumnWidth':
          return TplFlexColumnWidth.fromJson(json);
        case 'FractionColumnWidth':
          return TplFractionColumnWidth.fromJson(json);
      }
      throw Exception(
          'No table column width type name or unknown table column width type name');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(tcw.TableColumnWidth? object) {
    return object?.toJson();
  }
}
