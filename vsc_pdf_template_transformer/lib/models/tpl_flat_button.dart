import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_flat_button.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFlatButton implements wb.WidgetBuilder {
  TplFlatButton();

  String t = 'FlatButton';
  dynamic textColor;
  dynamic color;
  dynamic colorDown;
  dynamic colorRollover;
  TplEdgeInsets? padding;
  TplBoxDecoration? decoration;
  @JsonKey(defaultValue: {})
  Set<PdfAnnotFlags>? flags = {};
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  dynamic name;

  factory TplFlatButton.fromJson(Map<String, dynamic> json) =>
      _$TplFlatButtonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFlatButtonToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return FlatButton(
      textColor: await evaluateColor(color, data) ?? PdfColors.white,
      color: await evaluateColor(color, data) ?? PdfColors.blue,
      colorDown: await evaluateColor(color, data) ?? PdfColors.red,
      colorRollover: await evaluateColor(color, data) ?? PdfColors.blueAccent,
      padding: await padding?.toPdf(data),
      decoration: await decoration?.toPdf(data),
      flags: flags,
      child: child != null ? await child!.buildWidget(data) : SizedBox(),
      name: await evaluateText(name, data),
    );
  }
}
