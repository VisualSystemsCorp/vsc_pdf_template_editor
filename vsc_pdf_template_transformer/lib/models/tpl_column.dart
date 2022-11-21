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

  String t = 'Column';
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
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Column(
      mainAxisAlignment:
          await evaluateMainAxisAlignment(mainAxisAlignment, data) ??
              MainAxisAlignment.start,
      mainAxisSize:
          await evaluateMainAxisSize(mainAxisSize, data) ?? MainAxisSize.max,
      crossAxisAlignment:
          await evaluateCrossAxisAlignment(crossAxisAlignment, data) ??
              CrossAxisAlignment.center,
      verticalDirection:
          await evaluateVerticalDirection(verticalDirection, data) ??
              VerticalDirection.down,
      children: children == null ? [] : await getChildren(children!, data),
    );
  }
}
