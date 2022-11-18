import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/alignment.dart' as a;

part 'tpl_fitted_box.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFittedBox implements wb.WidgetBuilder {
  TplFittedBox();

  String className = 'TplFittedBox';
  dynamic fit;
  @AlignmentJsonConverter()
  a.Alignment? alignment;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplFittedBox.fromJson(Map<String, dynamic> json) =>
      _$TplFittedBoxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFittedBoxToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return FittedBox(
      fit: evaluateBoxFit(fit, data) ?? BoxFit.contain,
      alignment: alignment?.buildAlignment(data) ?? Alignment.center,
      child: child?.buildWidget(data),
    );
  }
}
