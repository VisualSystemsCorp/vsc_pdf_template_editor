import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_text_field.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTextField implements wb.WidgetBuilder {
  TplTextField();

  String t = 'TextField';
  dynamic name;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  dynamic width;
  dynamic height;
  List<dynamic>? flags;
  dynamic date;
  dynamic color;
  dynamic backgroundColor;
  dynamic highlighting;
  dynamic maxLength;
  dynamic alternateName;
  dynamic mappingName;
  List<dynamic>? fieldFlags;
  dynamic value;
  dynamic defaultValue;
  TplTextStyle? textStyle;

  factory TplTextField.fromJson(Map<String, dynamic> json) =>
      _$TplTextFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTextFieldToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return TextField(
        name: await evaluateText(name, data),
        child: await child?.buildWidget(data),
        width: await evaluateDouble(width, data) ?? 120,
        height: await evaluateDouble(height, data) ?? 13,
        flags: flags != null ? await getPdfAnnotFlags(flags!, data) : {},
        date: await evaluateDateTime(date, data),
        color: await evaluateColor(color, data),
        backgroundColor: await evaluateColor(backgroundColor, data),
        highlighting: await evaluatePdfAnnotHighlighting(highlighting, data),
        maxLength: await evaluateInt(maxLength, data),
        alternateName: await evaluateString(alternateName, data),
        mappingName: await evaluateString(mappingName, data),
        fieldFlags:
            fieldFlags != null ? await getPdfFieldFlags(fieldFlags!, data) : {},
        value: await evaluateString(value, data),
        defaultValue: await evaluateString(defaultValue, data),
        textStyle: await textStyle?.toPdf(data));
  }
}
