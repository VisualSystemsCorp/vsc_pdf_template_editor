import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_expanded.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplExpanded implements wb.WidgetBuilder {
  TplExpanded();

  String className = 'TplExpanded';
  dynamic flex;
  dynamic fit;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplExpanded.fromJson(Map<String, dynamic> json) =>
      _$TplExpandedFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplExpandedToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Expanded(
        flex: evaluateInt(flex, data) ?? 1,
        fit: evaluateFlexFit(fit, data) ?? FlexFit.tight,
        child: child != null ? child!.buildWidget(data) : SizedBox());
  }
}
