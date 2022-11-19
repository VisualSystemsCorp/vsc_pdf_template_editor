import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_pie_grid.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPieGrid implements wb.WidgetBuilder {
  TplPieGrid();

  String className = 'TplPieGrid';
  dynamic startAngle;

  factory TplPieGrid.fromJson(Map<String, dynamic> json) =>
      _$TplPieGridFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPieGridToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return PieGrid(startAngle: await evaluateDouble(startAngle, data) ?? 0);
  }
}
