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
  @JsonKey(defaultValue: Axis.vertical)
  Axis direction = Axis.vertical;
  @JsonKey(defaultValue: MainAxisAlignment.start)
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  @JsonKey(defaultValue: MainAxisSize.max)
  MainAxisSize mainAxisSize = MainAxisSize.max;
  @JsonKey(defaultValue: CrossAxisAlignment.center)
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
  @JsonKey(defaultValue: VerticalDirection.down)
  VerticalDirection verticalDirection = VerticalDirection.down;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplFlex.fromJson(Map<String, dynamic> json) =>
      _$TplFlexFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFlexToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Flex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      children: children == null ? [] : getChildren(children!, data),
    );
  }
}
