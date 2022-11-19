import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_repeater.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRepeater {
  String className = 'TplRepeater';

  dynamic array;
  @WidgetJsonConverter()
  wb.WidgetBuilder? childTemplate;

  TplRepeater();

  factory TplRepeater.fromJson(Map<String, dynamic> json) =>
      _$TplRepeaterFromJson(json);

  Map<String, dynamic> toJson() => _$TplRepeaterToJson(this);

  Future<List<Widget>> toPdf(Map<String, dynamic> data) async {
    final resultArray = await evaluateList(array, data);
    if (resultArray == null) return [];

    final widgets = <Widget>[];
    for (int i = 0; i < resultArray.length; i++) {
      final dataForChildWidget = createDataForRepeatedItem(
          itemData: resultArray[i], parentData: data, index: i);
      final widget = await childTemplate?.buildWidget(dataForChildWidget);
      if (widget != null) widgets.add(widget);
    }

    return widgets;
  }
}
