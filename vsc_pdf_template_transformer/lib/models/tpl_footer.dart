import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_footer.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFooter implements wb.WidgetBuilder {
  TplFooter();

  String className = 'TplFooter';
  @WidgetJsonConverter()
  wb.WidgetBuilder? leading;
  @WidgetJsonConverter()
  wb.WidgetBuilder? title;
  @WidgetJsonConverter()
  wb.WidgetBuilder? trailing;
  TplEdgeInsets? margin;
  TplEdgeInsets? padding;
  TplBoxDecoration? decoration;

  factory TplFooter.fromJson(Map<String, dynamic> json) =>
      _$TplFooterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFooterToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Footer(
        leading: leading?.buildWidget(data),
        title: title?.buildWidget(data),
        trailing: trailing?.buildWidget(data),
        margin: margin?.toPdf(data),
        padding: padding?.toPdf(data),
        decoration: decoration?.toPdf(data));
  }
}
