import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_chart_legend.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplChartLegend implements wb.WidgetBuilder {
  TplChartLegend();

  String t = 'ChartLegend';
  TplTextStyle? textStyle;
  TplAlignment? position;
  dynamic direction;
  TplBoxDecoration? decoration;
  TplEdgeInsets? padding;

  factory TplChartLegend.fromJson(Map<String, dynamic> json) =>
      _$TplChartLegendFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplChartLegendToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return ChartLegend(
        textStyle: await textStyle?.toPdf(data),
        position: await position?.buildAlignment(data) ?? Alignment.topRight,
        direction: await evaluateAxis(direction, data) ?? Axis.vertical,
        decoration: await decoration?.toPdf(data),
        padding: await padding?.toPdf(data) ?? EdgeInsets.all(5));
  }
}
