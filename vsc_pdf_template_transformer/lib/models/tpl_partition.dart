import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_partition.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPartition implements wb.WidgetBuilder {
  TplPartition();

  String className = 'TplPartition';
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  dynamic width;
  dynamic flex;

  factory TplPartition.fromJson(Map<String, dynamic> json) =>
      _$TplPartitionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPartitionToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Partition(
        child: child!.buildWidget(data) as SpanningWidget,
        width: evaluateDouble(width, data),
        flex: evaluateInt(flex, data) ?? 1);
  }
}
