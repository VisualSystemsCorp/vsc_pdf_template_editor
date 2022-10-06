import 'package:expressions/expressions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_container.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplContainer implements wb.WidgetBuilder {
  String className = 'TplContainer';
  @JsonKey()
  String? width;
  @JsonKey()
  String? height;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  TplContainer({
    this.width,
    this.height,
    this.child,
  });

  factory TplContainer.fromJson(Map<String, dynamic> json) =>
      _$TplContainerFromJson(json);

  Map<String, dynamic> toJson() => _$TplContainerToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    var value = Container(
        width: _evaluateInput(width, data),
        height: _evaluateInput(height, data),
        child: child?.buildWidget(data));
    return value;
  }

  double? _evaluateInput(String? input, Map<String, dynamic> data) {
    if (input != null && data.isNotEmpty) {
      final evaluator = ExpressionEvaluator(memberAccessors: [
        MemberAccessor.mapAccessor,
      ]);
      dynamic res;
      final context = {
        'data': data,
      };

      res = evaluator.eval(
          Expression.parse(input), Map<String, dynamic>.from(context));
      double? parsedRes;
      parsedRes = res != null ? double.parse(res!.toString()) : null;
      return parsedRes;
    } else
      return input != null ? double.parse(input) : null;
  }
}
