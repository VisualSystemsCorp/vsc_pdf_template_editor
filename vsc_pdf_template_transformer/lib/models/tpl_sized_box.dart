import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_sized_box.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplSizedBox implements wb.WidgetBuilder {
  String className = 'TplSizedBox';

  @JsonKey()
  dynamic width;

  @JsonKey()
  dynamic height;

  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  TplSizedBox({
    this.width,
    this.height,
    this.child,
  });

  factory TplSizedBox.fromJson(Map<String, dynamic> json) =>
      _$TplSizedBoxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplSizedBoxToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return SizedBox(
        width: await evaluateDouble(width, data),
        height: await evaluateDouble(height, data),
        child: await child?.buildWidget(data));
  }
}
