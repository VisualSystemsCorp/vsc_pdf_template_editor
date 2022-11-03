import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_positioned.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPositioned implements wb.WidgetBuilder {
  TplPositioned();

  String className = 'TplPositioned';
  dynamic left;
  dynamic top;
  dynamic right;
  dynamic bottom;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplPositioned.fromJson(Map<String, dynamic> json) =>
      _$TplPositionedFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPositionedToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Positioned(
        left: evaluateDouble(left, data),
        top: evaluateDouble(top, data),
        right: evaluateDouble(right, data),
        bottom: evaluateDouble(bottom, data),
        child: child?.buildWidget(data) ?? SizedBox());
  }
}
