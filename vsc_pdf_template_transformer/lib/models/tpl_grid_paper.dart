import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/evaluator.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_grid_paper.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplGridPaper implements wb.WidgetBuilder {
  TplGridPaper();

  String className = 'TplGridPaper';

  dynamic color;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  TplEdgeInsets? margin;
  dynamic type;

  factory TplGridPaper.fromJson(Map<String, dynamic> json) =>
      _$TplGridPaperFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplGridPaperToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    final gridStr = await evaluateString(type, data);
    switch (gridStr) {
      case 'millimeter':
        return GridPaper.millimeter(
            color: await evaluateColor(color, data)!,
            child: await child?.buildWidget(data));
      case 'seyes':
        return GridPaper.seyes(
          margin: margin!.toPdf(data),
          child: await child?.buildWidget(data),
        );
      case 'collegeRuled':
        return GridPaper.collegeRuled(
          margin: margin!.toPdf(data),
          child: await child?.buildWidget(data),
        );
      case 'quad':
        return GridPaper.quad(
            color: await evaluateColor(color, data)!,
            child: await child?.buildWidget(data));
      case 'engineering':
        return GridPaper.engineering(
            color: await evaluateColor(color, data)!,
            child: await child?.buildWidget(data));
      default:
        throw Exception('Invalid grid paper type: $gridStr');
    }
  }
}
