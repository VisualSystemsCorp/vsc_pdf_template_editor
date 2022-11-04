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

  factory TplTableRow.fromJson(Map<String, dynamic> json) =>
      _$TplTableRowFromJson(json);

  Map<String, dynamic> toJson() => _$TplTableRowToJson(this);

  TableRow buildRow(Map<String, dynamic> data) {
    return TableRow(
        children: children == null ? [] : getChildren(children!, data),
        repeat: evaluateBool(repeat, data) ?? false,
        verticalAlignment:
            evaluateTableCellVerticalAlignment(verticalAlignment, data),
        decoration: decoration?.toPdf(data));
  }
}