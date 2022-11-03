import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_link.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplLink implements wb.WidgetBuilder {
  TplLink();

  String className = 'TplLink';
  dynamic destination;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplLink.fromJson(Map<String, dynamic> json) =>
      _$TplLinkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplLinkToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Link(
        destination: evaluateString(destination, data) ?? '',
        child: child?.buildWidget(data) ?? SizedBox());
  }
}
