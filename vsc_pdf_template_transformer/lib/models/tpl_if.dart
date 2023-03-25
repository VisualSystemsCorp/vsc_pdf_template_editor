import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_if.g.dart';

/// Based on the result of the boolean [expression], returns either [thenChild] or [elseChild].
/// A null result from [expression] is equivalent to it returning false. If either child widget
/// is not defined, [SizedBox.shrink]\() is returned instead.
@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplIf implements wb.WidgetBuilder {
  String t = 'If';

  dynamic expression;

  @WidgetJsonConverter()
  wb.WidgetBuilder? thenChild;

  @WidgetJsonConverter()
  wb.WidgetBuilder? elseChild;

  TplIf();

  factory TplIf.fromJson(Map<String, dynamic> json) => _$TplIfFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplIfToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    final conditionResult = await evaluateBool(expression, data);
    final widget = conditionResult == true
        ? await thenChild?.buildWidget(data)
        : await elseChild?.buildWidget(data);

    if (widget == null) {
      return SizedBox.shrink();
    }

    return widget;
  }
}
