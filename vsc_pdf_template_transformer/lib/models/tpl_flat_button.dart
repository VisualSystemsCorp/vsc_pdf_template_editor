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

  String className = 'TplFlatButton';
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
  Widget buildWidget(Map<String, dynamic> data) {
    return FlatButton(
      textColor: evaluateColor(color, data) ?? PdfColors.white,
      color: evaluateColor(color, data) ?? PdfColors.blue,
      colorDown: evaluateColor(color, data) ?? PdfColors.red,
      colorRollover: evaluateColor(color, data) ?? PdfColors.blueAccent,
      padding: padding?.toPdf(data),
      decoration: decoration?.toPdf(data),
      flags: flags,
      child: child != null ? child!.buildWidget(data) : SizedBox(),
      name: evaluateString(name, data) ?? '',
    );
  }
}
