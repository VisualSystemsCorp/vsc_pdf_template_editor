import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/widget_json_converter.dart';

part 'tpl_table_row.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTableRow {
  TplTableRow();

  @WidgetJsonConverter()
  List<dynamic>? children;
  dynamic repeat;
  dynamic verticalAlignment;
  TplBoxDecoration? decoration;

  /// If set, this row is repeated over the given array and this row serves as a template.
  /// It sets variables in the `data` just like [TplRepeater].
  dynamic array;

  factory TplTableRow.fromJson(Map<String, dynamic> json) =>
      _$TplTableRowFromJson(json);

  Map<String, dynamic> toJson() => _$TplTableRowToJson(this);

  Future<TableRow> buildRow(Map<String, dynamic> data) async {
    return TableRow(
        children: children == null ? [] : await getChildren(children!, data),
        repeat: await evaluateBool(repeat, data) ?? false,
        verticalAlignment:
            await evaluateTableCellVerticalAlignment(verticalAlignment, data),
        decoration: await decoration?.toPdf(data));
  }
}
