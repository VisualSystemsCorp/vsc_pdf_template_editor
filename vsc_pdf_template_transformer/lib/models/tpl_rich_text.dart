import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/inline_span_json_converter.dart';

import '../utils/inline_span.dart' as ins;
import '../utils/widget_builder.dart' as wb;

part 'tpl_rich_text.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRichText implements wb.WidgetBuilder {
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
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return RichText(
      text: await text!.buildInlineSpan(data),
      textAlign: await evaluateTextAlign(textAlign, data),
      textDirection: await evaluateTextDirection(textDirection, data),
      softWrap: await evaluateBool(softWrap, data),
      tightBounds: await evaluateBool(tightBounds, data) ?? false,
      textScaleFactor: await evaluateDouble(textScaleFactor, data) ?? 1,
      maxLines: await evaluateInt(maxLines, data),
      overflow: await evaluateTextOverflow(overflow, data),
    );
  }
}
