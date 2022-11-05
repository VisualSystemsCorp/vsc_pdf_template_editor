import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_opacity.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplOpacity implements wb.WidgetBuilder {
  TplOpacity();

  String className = 'TplOpacity';

  dynamic opacity;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplOpacity.fromJson(Map<String, dynamic> json) =>
      _$TplOpacityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplOpacityToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Opacity(
        opacity: evaluateDouble(opacity, data) ?? 1,
        child: child?.buildWidget(data));
  }
}
