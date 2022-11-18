import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/table_column_width.dart' as tcw;

part 'tpl_intrinsic_column_width.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplIntrinsicColumnWidth implements tcw.TableColumnWidth {
  TplIntrinsicColumnWidth();

  String className = 'TplIntrinsicColumnWidth';
  dynamic flex;

  factory TplIntrinsicColumnWidth.fromJson(Map<String, dynamic> json) =>
      _$TplIntrinsicColumnWidthFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplIntrinsicColumnWidthToJson(this);

  @override
  TableColumnWidth buildTableColumnWidth(Map<String, dynamic> data) {
    return IntrinsicColumnWidth(flex: evaluateDouble(flex, data));
  }
}
