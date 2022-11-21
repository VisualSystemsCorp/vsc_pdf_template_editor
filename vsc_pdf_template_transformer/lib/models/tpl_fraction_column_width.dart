import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/table_column_width.dart' as tcw;

part 'tpl_fraction_column_width.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFractionColumnWidth implements tcw.TableColumnWidth {
  TplFractionColumnWidth();

  String t = 'FractionColumnWidth';
  dynamic value;

  factory TplFractionColumnWidth.fromJson(Map<String, dynamic> json) =>
      _$TplFractionColumnWidthFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFractionColumnWidthToJson(this);

  @override
  Future<TableColumnWidth> buildTableColumnWidth(
      Map<String, dynamic> data) async {
    return FractionColumnWidth(await evaluateDouble(value, data) ?? 0);
  }
}
