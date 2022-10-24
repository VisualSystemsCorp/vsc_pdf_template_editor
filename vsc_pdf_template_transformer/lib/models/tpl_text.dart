import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import '../utils/widget_builder.dart' as wb;
import 'tpl_text_style.dart';
import '../utils/evaluator.dart';

part 'tpl_text.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplText implements wb.WidgetBuilder {
  TplText();

  String className = 'TplText';
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
  Widget buildWidget(Map<String, dynamic> data) {
    return Text(
      evaluateString(text, data).toString(),
      style: style?.toPdf(data),
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
