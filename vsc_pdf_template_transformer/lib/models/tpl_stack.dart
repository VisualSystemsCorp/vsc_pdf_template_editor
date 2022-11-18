import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/alignment.dart' as a;
import '../utils/widget_builder.dart' as wb;

part 'tpl_stack.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplStack implements wb.WidgetBuilder {
  TplStack();

  String className = 'TplStack';
  @AlignmentJsonConverter()
  a.Alignment? alignment;
  dynamic fit;
  dynamic overflow;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplStack.fromJson(Map<String, dynamic> json) =>
      _$TplStackFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplStackToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Stack(
      alignment: alignment?.buildAlignment(data) ?? Alignment.topLeft,
      fit: evaluateStackFit(fit, data) ?? StackFit.loose,
      overflow: evaluateOverflow(overflow, data) ?? Overflow.clip,
      children: children == null ? [] : getChildren(children!, data),
    );
  }
}
