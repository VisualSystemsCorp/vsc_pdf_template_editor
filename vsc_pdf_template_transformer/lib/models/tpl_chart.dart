import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_chart.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplChart implements wb.WidgetBuilder {
  TplChart();

  String className = 'TplChart';
  @WidgetJsonConverter()
  List<wb.WidgetBuilder?>? datasets;
  @WidgetJsonConverter()
  wb.WidgetBuilder? grid;
  @WidgetJsonConverter()
  wb.WidgetBuilder? overlay;
  @WidgetJsonConverter()
  wb.WidgetBuilder? title;
  @WidgetJsonConverter()
  wb.WidgetBuilder? bottom;
  @WidgetJsonConverter()
  wb.WidgetBuilder? left;
  @WidgetJsonConverter()
  wb.WidgetBuilder? right;

  factory TplChart.fromJson(Map<String, dynamic> json) =>
      _$TplChartFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplChartToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Chart(
        grid: grid!.buildWidget(data) as ChartGrid,
        datasets: getDatasets(datasets!, data),
        overlay: overlay?.buildWidget(data),
        title: title?.buildWidget(data),
        bottom: bottom?.buildWidget(data),
        left: left?.buildWidget(data),
        right: right?.buildWidget(data));
  }
}
