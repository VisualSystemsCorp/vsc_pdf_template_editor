import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_row.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/table_column_width_json_converter.dart';
import '../utils/widget_builder.dart' as wb;
import '../utils/table_column_width.dart' as tcw;

part 'tpl_table.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTable implements wb.WidgetBuilder {
  TplTable();

  String className = 'TplTable';
  List<TplTableRow>? children;
  TplTableBorder? border;
  dynamic defaultVerticalAlignment;
  @TableColumnWidthJsonConverter()
  List<dynamic>? columnWidths;
  @TableColumnWidthJsonConverter()
  tcw.TableColumnWidth? defaultColumnWidth;
  dynamic tableWidth;

  factory TplTable.fromJson(Map<String, dynamic> json) =>
      _$TplTableFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTableToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Table(
      children: children == null ? [] : getTableRows(children!, data),
      border: border?.toPdf(data),
      defaultVerticalAlignment:
          evaluateTableCellVerticalAlignment(defaultVerticalAlignment, data) ??
              TableCellVerticalAlignment.top,
      columnWidths: columnWidths == null
          ? {}
          : getTableColumnWidths(columnWidths!, data).asMap(),
      defaultColumnWidth: defaultColumnWidth?.buildTableColumnWidth(data) ??
          IntrinsicColumnWidth(),
      tableWidth: evaluateTableWidth(tableWidth, data) ?? TableWidth.max,
    );
  }
}
