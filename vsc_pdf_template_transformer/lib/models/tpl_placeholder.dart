import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_placeholder.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPlaceholder implements wb.WidgetBuilder {
  TplPlaceholder();

  String className = 'TplPlaceholder';
  dynamic color;
  dynamic strokeWidth;
  dynamic fallbackWidth;
  dynamic fallbackHeight;

  factory TplPlaceholder.fromJson(Map<String, dynamic> json) =>
      _$TplPlaceholderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPlaceholderToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Placeholder(
      color: await evaluateColor(color, data) ?? PdfColor.fromInt(0xFF455A64),
      strokeWidth: await evaluateDouble(strokeWidth, data) ?? 2.0,
      fallbackWidth: await evaluateDouble(fallbackWidth, data) ?? 400.0,
      fallbackHeight: await evaluateDouble(fallbackHeight, data) ?? 400.0,
    );
  }
}
