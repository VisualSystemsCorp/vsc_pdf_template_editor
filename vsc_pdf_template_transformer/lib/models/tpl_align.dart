import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/alignment.dart' as a;

part 'tpl_align.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAlign implements wb.WidgetBuilder {
  TplAlign();

  String className = 'TplAlign';
  @AlignmentJsonConverter()
  a.Alignment? alignment;
  dynamic widthFactor;
  dynamic heightFactor;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplAlign.fromJson(Map<String, dynamic> json) =>
      _$TplAlignFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAlignToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Align(
        alignment: await alignment?.buildAlignment(data) ?? Alignment.center,
        widthFactor: await evaluateDouble(widthFactor, data),
        heightFactor: await evaluateDouble(heightFactor, data),
        child: await child?.buildWidget(data));
  }
}
