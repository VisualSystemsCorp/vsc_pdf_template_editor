import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partition.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_partitions.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPartitions implements wb.WidgetBuilder {
  TplPartitions();

  String className = 'TplPartitions';
  @WidgetJsonConverter()
  List<TplPartition>? children;
  dynamic mainAxisSize;

  factory TplPartitions.fromJson(Map<String, dynamic> json) =>
      _$TplPartitionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPartitionsToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Partitions(
        children: children == null ? [] : getPartitions(children!, data),
        mainAxisSize:
            evaluateMainAxisSize(mainAxisSize, data) ?? MainAxisSize.max);
  }
}
