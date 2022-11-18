import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_listview.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplListView implements wb.WidgetBuilder {
  TplListView();

  String className = 'TplListView';
  dynamic direction;
  dynamic reverse;
  dynamic spacing;
  TplEdgeInsets? padding;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplListView.fromJson(Map<String, dynamic> json) =>
      _$TplListViewFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplListViewToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return ListView(
      direction: evaluateAxis(direction, data) ?? Axis.vertical,
      reverse: evaluateBool(reverse, data) ?? false,
      spacing: evaluateDouble(spacing, data) ?? 0,
      padding: padding?.toPdf(data),
      children: children == null ? [] : getChildren(children!, data),
    );
  }
}
