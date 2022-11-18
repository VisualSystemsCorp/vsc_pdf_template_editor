import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_column.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplColumn implements wb.WidgetBuilder {
  TplColumn();

  String className = 'TplColumn';
  dynamic mainAxisAlignment;
  dynamic mainAxisSize;
  dynamic crossAxisAlignment;
  dynamic verticalDirection;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplColumn.fromJson(Map<String, dynamic> json) =>
      _$TplColumnFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplColumnToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Column(
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
