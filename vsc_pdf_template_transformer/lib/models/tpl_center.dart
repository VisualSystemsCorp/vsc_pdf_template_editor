import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_center.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplCenter implements wb.WidgetBuilder {
  TplCenter();

  String t = 'Center';
  dynamic widthFactor;
  dynamic heightFactor;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplCenter.fromJson(Map<String, dynamic> json) =>
      _$TplCenterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplCenterToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Center(
        widthFactor: await evaluateDouble(widthFactor, data),
        heightFactor: await evaluateDouble(heightFactor, data),
        child: await child?.buildWidget(data));
  }
}
