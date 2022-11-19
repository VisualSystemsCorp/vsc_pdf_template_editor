import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_aspect_ratio.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAspectRatio implements wb.WidgetBuilder {
  TplAspectRatio();

  String className = 'TplAspectRatio';
  dynamic aspectRatio;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplAspectRatio.fromJson(Map<String, dynamic> json) =>
      _$TplAspectRatioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAspectRatioToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return AspectRatio(
        aspectRatio: await evaluateDouble(aspectRatio, data) ?? 1.0,
        child: await child?.buildWidget(data));
  }
}
