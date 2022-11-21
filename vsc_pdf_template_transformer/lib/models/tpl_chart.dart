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

  String t = 'Chart';
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
        grid: await grid!.buildWidget(data) as ChartGrid,
        datasets: await getDatasets(datasets!, data),
        overlay: await overlay?.buildWidget(data),
        title: await title?.buildWidget(data),
        bottom: await bottom?.buildWidget(data),
        left: await left?.buildWidget(data),
        right: await right?.buildWidget(data));
  }
}
