import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_flex.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFlex implements wb.WidgetBuilder {
  TplFlex();

  String className = 'TplFlex';
  dynamic direction;
  dynamic mainAxisAlignment;
  dynamic mainAxisSize;
  dynamic crossAxisAlignment;
  dynamic verticalDirection;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplFlex.fromJson(Map<String, dynamic> json) =>
      _$TplFlexFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFlexToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Flex(
      direction: evaluateAxis(direction, data) ?? Axis.vertical,
      mainAxisAlignment: evaluateMainAxisAlignment(mainAxisAlignment, data) ??
          MainAxisAlignment.start,
      mainAxisSize:
          evaluateMainAxisSize(mainAxisSize, data) ?? MainAxisSize.max,
      crossAxisAlignment:
          evaluateCrossAxisAlignment(crossAxisAlignment, data) ??
              CrossAxisAlignment.center,
      verticalDirection: evaluateVerticalDirection(verticalDirection, data) ??
          VerticalDirection.down,
      children: children == null ? [] : getChildren(children!, data),
    );
  }
}
