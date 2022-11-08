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

  String className = 'TplTextField';
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
  Widget buildWidget(Map<String, dynamic> data) {
    return TextField(
        name: evaluateString(name, data) ?? '',
        child: child?.buildWidget(data),
        width: evaluateDouble(width, data) ?? 120,
        height: evaluateDouble(height, data) ?? 13,
        flags: flags != null ? getPdfAnnotFlags(flags!, data) : {},
        date: date != null
            ? DateTime.parse(evaluateString(date, data) ?? '')
            : null,
        color: evaluateColor(color, data),
        backgroundColor: evaluateColor(backgroundColor, data),
        highlighting: evaluatePdfAnnotHighlighting(highlighting, data),
        maxLength: evaluateInt(maxLength, data),
        alternateName: evaluateString(alternateName, data),
        mappingName: evaluateString(mappingName, data),
        fieldFlags:
            fieldFlags != null ? getPdfFieldFlags(fieldFlags!, data) : {},
        value: evaluateString(value, data),
        defaultValue: evaluateString(defaultValue, data),
        textStyle: textStyle?.toPdf(data));
  }
}
