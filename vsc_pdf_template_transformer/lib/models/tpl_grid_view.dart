import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_grid_view.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplGridView implements wb.WidgetBuilder {
  TplGridView();

  String t = 'GridView';

  dynamic direction;
  TplEdgeInsets? padding;
  dynamic crossAxisCount;
  dynamic mainAxisSpacing;
  dynamic crossAxisSpacing;
  dynamic childAspectRatio;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplGridView.fromJson(Map<String, dynamic> json) =>
      _$TplGridViewFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplGridViewToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return GridView(
      direction: await evaluateAxis(direction, data) ?? Axis.vertical,
      padding: await padding?.toPdf(data) ?? EdgeInsets.zero,
      crossAxisCount: await evaluateInt(crossAxisCount, data) ?? 1,
      mainAxisSpacing: await evaluateDouble(mainAxisSpacing, data) ?? 0,
      crossAxisSpacing: await evaluateDouble(crossAxisSpacing, data) ?? 0,
      childAspectRatio:
          await evaluateDouble(childAspectRatio, data) ?? double.infinity,
      children: children == null ? [] : await getChildren(children!, data),
    );
  }
}
