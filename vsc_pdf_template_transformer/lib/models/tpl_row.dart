import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_row.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRow implements wb.WidgetBuilder {
  TplRow();

  String className = 'TplRow';
  dynamic mainAxisAlignment;
  dynamic mainAxisSize;
  dynamic crossAxisAlignment;
  dynamic verticalDirection;
  @WidgetJsonConverter()
  List<dynamic>? children;

  factory TplRow.fromJson(Map<String, dynamic> json) => _$TplRowFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRowToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Row(
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
