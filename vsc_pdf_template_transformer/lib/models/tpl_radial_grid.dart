import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_radial_grid.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRadialGrid implements wb.WidgetBuilder {
  TplRadialGrid();

  String className = 'TplRadialGrid';

  factory TplRadialGrid.fromJson(Map<String, dynamic> json) =>
      _$TplRadialGridFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRadialGridToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return RadialGrid();
  }
}
