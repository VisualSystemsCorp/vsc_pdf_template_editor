import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/table_column_width.dart' as tcw;

part 'tpl_fixed_column_width.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFixedColumnWidth implements tcw.TableColumnWidth {
  TplFixedColumnWidth();

  String className = 'TplFixedColumnWidth';
  dynamic width;

  factory TplFixedColumnWidth.fromJson(Map<String, dynamic> json) =>
      _$TplFixedColumnWidthFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFixedColumnWidthToJson(this);

  @override
  TableColumnWidth buildTableColumnWidth(Map<String, dynamic> data) {
    return FixedColumnWidth(evaluateDouble(width, data) ?? 0);
  }
}
