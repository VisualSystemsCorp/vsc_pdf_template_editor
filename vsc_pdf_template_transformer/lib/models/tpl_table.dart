import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_table_row.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/table_column_width_json_converter.dart';

import '../utils/table_column_width.dart' as tcw;
import '../utils/widget_builder.dart' as wb;

part 'tpl_table.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTable implements wb.WidgetBuilder {
  TplTable();

  String t = 'Table';
  List<TplTableRow>? children;
  TplTableBorder? border;
  dynamic defaultVerticalAlignment;
  @TableColumnWidthJsonConverter()
  List<tcw.TableColumnWidth?>? columnWidths;
  @TableColumnWidthJsonConverter()
  tcw.TableColumnWidth? defaultColumnWidth;
  dynamic tableWidth;

  factory TplTable.fromJson(Map<String, dynamic> json) =>
      _$TplTableFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTableToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Table(
      children: await _getTableRows(data),
      border: await border?.toPdf(data),
      defaultVerticalAlignment: await evaluateTableCellVerticalAlignment(
              defaultVerticalAlignment, data) ??
          TableCellVerticalAlignment.top,
      columnWidths: columnWidths == null
          ? {}
          : (await getTableColumnWidths(columnWidths!, data)).asMap(),
      defaultColumnWidth:
          await defaultColumnWidth?.buildTableColumnWidth(data) ??
              IntrinsicColumnWidth(),
      tableWidth: await evaluateTableWidth(tableWidth, data) ?? TableWidth.max,
    );
  }

  Future<List<TableRow>> _getTableRows(Map<String, dynamic> data) async {
    final List<TableRow> res = [];

    for (final row in children ?? []) {
      if (row.array != null) {
        // This is a repeating row. Treat it similar to TplRepeater.
        res.addAll(await _getRepeatingRows(row, data));
      } else {
        res.add(await (row as TplTableRow).buildRow(data));
      }
    }
    return res;
  }

  Future<List<TableRow>> _getRepeatingRows(
      TplTableRow row, Map<String, dynamic> data) async {
    final resultArray = await evaluateList(row.array, data);
    if (resultArray == null) return [];
    final List<TableRow> rows = [];
    for (int i = 0; i < resultArray.length; i++) {
      final dataForChildRow = createDataForRepeatedItem(
          itemData: resultArray[i], parentData: data, index: i);
      rows.add(await row.buildRow(dataForChildRow));
    }

    return rows;
  }
}
