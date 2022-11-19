import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_clip_rrect.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplClipRRect implements wb.WidgetBuilder {
  TplClipRRect();

  String className = 'TplClipRRect';
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  dynamic horizontalRadius;
  dynamic verticalRadius;

  factory TplClipRRect.fromJson(Map<String, dynamic> json) =>
      _$TplClipRRectFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplClipRRectToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return ClipRRect(
        child: await child?.buildWidget(data),
        horizontalRadius: await evaluateDouble(horizontalRadius, data) ?? 0,
        verticalRadius: await evaluateDouble(verticalRadius, data) ?? 0);
  }
}
