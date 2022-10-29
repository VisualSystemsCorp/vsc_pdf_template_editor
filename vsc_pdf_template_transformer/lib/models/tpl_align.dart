import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_align.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAlign implements wb.WidgetBuilder {
  TplAlign();

  String className = 'TplAlign';
  TplAlignment? alignment;
  dynamic widthFactor;
  dynamic heightFactor;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplAlign.fromJson(Map<String, dynamic> json) =>
      _$TplAlignFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAlignToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Align(
        alignment: alignment?.toPdf(data) ?? Alignment.center,
        widthFactor: evaluateDouble(widthFactor, data),
        heightFactor: evaluateDouble(heightFactor, data),
        child: child?.buildWidget(data));
  }
}
