import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fixed_axis.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_cartesian_grid.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplCartesianGrid implements wb.WidgetBuilder {
  TplCartesianGrid();

  String className = 'TplCartesianGrid';
  TplFixedAxis? xAxis;
  TplFixedAxis? yAxis;

  factory TplCartesianGrid.fromJson(Map<String, dynamic> json) =>
      _$TplCartesianGridFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplCartesianGridToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return CartesianGrid(xAxis: xAxis!.toPdf(data), yAxis: yAxis!.toPdf(data));
  }
}
