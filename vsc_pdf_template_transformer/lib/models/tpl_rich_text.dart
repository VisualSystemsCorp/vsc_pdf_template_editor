import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/inline_span_json_converter.dart';
import '../utils/inline_span.dart' as ins;
import '../utils/spanning_widget.dart' as sw;

part 'tpl_rich_text.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRichText implements sw.SpanningWidgetBuilder {
  TplRichText();

  String className = 'TplRichText';
  @InlineSpanJsonConverter()
  ins.InlineSpan? text;
  dynamic textAlign;
  dynamic textDirection;
  dynamic softWrap = true;
  dynamic tightBounds = false;
  dynamic textScaleFactor;
  dynamic maxLines;
  dynamic overflow;

  factory TplRichText.fromJson(Map<String, dynamic> json) =>
      _$TplRichTextFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRichTextToJson(this);

  @override
  SpanningWidget buildWidget(Map<String, dynamic> data) {
    return RichText(
      text: text!.buildInlineSpan(data),
      textAlign: evaluateTextAlign(textAlign, data),
      textDirection: evaluateTextDirection(textDirection, data),
      softWrap: evaluateBool(softWrap, data),
      tightBounds: evaluateBool(tightBounds, data) ?? false,
      textScaleFactor: evaluateDouble(textScaleFactor, data) ?? 1,
      maxLines: evaluateInt(maxLines, data),
      overflow: evaluateTextOverflow(overflow, data),
    );
  }
}
