import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/table_column_width.dart' as tcw;

part 'tpl_flex_column_width.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFlexColumnWidth implements tcw.TableColumnWidth {
  TplFlexColumnWidth();

  String className = 'TplFlexColumnWidth';
  dynamic flex;

  factory TplFlexColumnWidth.fromJson(Map<String, dynamic> json) =>
      _$TplFlexColumnWidthFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFlexColumnWidthToJson(this);

  @override
  TableColumnWidth buildTableColumnWidth(Map<String, dynamic> data) {
    return FlexColumnWidth(await evaluateDouble(flex, data) ?? 1);
  }
}
