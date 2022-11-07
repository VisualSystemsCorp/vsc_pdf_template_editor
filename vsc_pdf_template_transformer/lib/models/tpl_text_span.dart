import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/inline_span_json_converter.dart';
import '../utils/inline_span.dart' as ins;

part 'tpl_text_span.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTextSpan implements ins.InlineSpan {
  TplTextSpan();

  String className = 'TplTextSpan';
  @InlineSpanJsonConverter()
  List<ins.InlineSpan?>? children;
  dynamic text;
  dynamic baseline;
  TplTextStyle? style;

  factory TplTextSpan.fromJson(Map<String, dynamic> json) =>
      _$TplTextSpanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTextSpanToJson(this);

  @override
  InlineSpan buildInlineSpan(Map<String, dynamic> data) {
    return TextSpan(
        children:
            children == null ? [] : getInlineSpanChildren(children!, data),
        baseline: evaluateDouble(baseline, data) ?? 0,
        text: evaluateString(text, data),
        style: style?.toPdf(data),
        annotation: null);
  }
}
