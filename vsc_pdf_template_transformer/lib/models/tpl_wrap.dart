import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_wrap.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplWrap implements wb.WidgetBuilder {
  TplWrap();

  String className = 'TplWrap';
  dynamic direction;
  dynamic alignment;
  dynamic spacing;
  dynamic runAlignment;
  dynamic runSpacing;
  dynamic crossAxisAlignment;
  dynamic verticalDirection;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplWrap.fromJson(Map<String, dynamic> json) =>
      _$TplWrapFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplWrapToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Wrap(
      direction: await evaluateAxis(direction, data) ?? Axis.horizontal,
      alignment:
          await evaluateWrapAlignment(alignment, data) ?? WrapAlignment.start,
      spacing: await evaluateDouble(spacing, data) ?? 0,
      runAlignment: await evaluateWrapAlignment(runAlignment, data) ??
          WrapAlignment.start,
      runSpacing: await evaluateDouble(runSpacing, data) ?? 0,
      crossAxisAlignment:
          await evaluateWrapCrossAlignment(crossAxisAlignment, data) ??
              WrapCrossAlignment.start,
      verticalDirection:
          await evaluateVerticalDirection(verticalDirection, data) ??
              VerticalDirection.down,
      children: children == null ? [] : await getChildren(children!, data),
    );
  }
}
