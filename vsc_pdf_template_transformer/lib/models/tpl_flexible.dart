import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_flexible.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFlexible implements wb.WidgetBuilder {
  TplFlexible();

  String className = 'TplFlexible';
  dynamic flex;
  dynamic fit;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplFlexible.fromJson(Map<String, dynamic> json) =>
      _$TplFlexibleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFlexibleToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Flexible(
        flex: await evaluateInt(flex, data) ?? 1,
        fit: evaluateFlexFit(fit, data) ?? FlexFit.loose,
        child: child != null ? child!.buildWidget(data) : SizedBox());
  }
}
