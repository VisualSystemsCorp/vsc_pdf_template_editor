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

  String t = 'LimitedBox';
  dynamic maxWidth;
  dynamic maxHeight;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplLimitedBox.fromJson(Map<String, dynamic> json) =>
      _$TplLimitedBoxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplLimitedBoxToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return LimitedBox(
      maxWidth: await evaluateDouble(maxWidth, data) ?? double.infinity,
      maxHeight: await evaluateDouble(maxHeight, data) ?? double.infinity,
      child: await child?.buildWidget(data),
    );
  }
}
