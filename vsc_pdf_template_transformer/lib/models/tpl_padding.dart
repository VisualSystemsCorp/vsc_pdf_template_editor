import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_padding.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPadding implements wb.WidgetBuilder {
  TplPadding();

  String className = 'TplPadding';
  TplEdgeInsets? padding;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplPadding.fromJson(Map<String, dynamic> json) =>
      _$TplPaddingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPaddingToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Padding(
      padding: padding != null ? await padding!.toPdf(data) : EdgeInsets.zero,
      child: await child?.buildWidget(data),
    );
  }
}
