import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';

import '../utils/evaluator.dart';
import '../utils/widget_builder.dart' as wb;
import 'tpl_text_style.dart';

part 'tpl_text.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplText implements wb.WidgetBuilder {
  TplText();

  String t = 'Text';
  dynamic text;
  TplTextStyle? style;
  dynamic textAlign;
  dynamic textDirection;
  @JsonKey(defaultValue: true)
  dynamic softWrap = true;
  @JsonKey(defaultValue: false)
  dynamic tightBounds = false;
  @JsonKey(defaultValue: 1.0)
  dynamic textScaleFactor;
  @JsonKey(defaultValue: 1)
  dynamic maxLines;
  dynamic overflow;

  factory TplText.fromJson(Map<String, dynamic> json) =>
      _$TplTextFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTextToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Text(
      await evaluateText(text, data),
      style: await style?.toPdf(data),
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
