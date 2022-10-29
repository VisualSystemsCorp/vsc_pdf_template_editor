import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_limited_box.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplLimitedBox implements wb.WidgetBuilder {
  TplLimitedBox();

  String className = 'TplLimitedBox';
  dynamic maxWidth;
  dynamic maxHeight;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplLimitedBox.fromJson(Map<String, dynamic> json) =>
      _$TplLimitedBoxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplLimitedBoxToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return LimitedBox(
      maxWidth: evaluateDouble(maxWidth, data) ?? double.infinity,
      maxHeight: evaluateDouble(maxHeight, data) ?? double.infinity,
      child: child?.buildWidget(data),
    );
  }
}
