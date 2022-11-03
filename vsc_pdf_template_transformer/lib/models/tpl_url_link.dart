import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_url_link.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplUrlLink implements wb.WidgetBuilder {
  TplUrlLink();

  String className = 'TplUrlLink';
  dynamic destination;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplUrlLink.fromJson(Map<String, dynamic> json) =>
      _$TplUrlLinkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplUrlLinkToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return UrlLink(
        destination: evaluateString(destination, data) ?? '',
        child: child?.buildWidget(data) ?? SizedBox());
  }
}
