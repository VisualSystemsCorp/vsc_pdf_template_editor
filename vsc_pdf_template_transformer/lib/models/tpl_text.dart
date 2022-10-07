import 'package:expressions/expressions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import '../utils/widget_builder.dart' as wb;
import 'tpl_text_style.dart';

part 'tpl_text.g.dart';

@JsonSerializable(
  checked: true,
  // Extra type checking
  disallowUnrecognizedKeys: false,
  // Allow unrecognized keys (e.g., "className") in JSON
  explicitToJson:
      true, // Allows deserialization of nested JSON objects.  (e.g., TplTextStyle)
)
class TplText implements wb.WidgetBuilder {
  String className = 'TplText';
  TplString text;
  @JsonKey(defaultValue: null)
  TplTextStyle? style;
  @JsonKey(defaultValue: TextAlign.left)
  TextAlign textAlign;
  @JsonKey(defaultValue: TextDirection.ltr)
  TextDirection textDirection;
  @JsonKey(defaultValue: true)
  bool softWrap;
  @JsonKey(defaultValue: false)
  bool tightBounds = false;
  @JsonKey(defaultValue: 1.0)
  double textScaleFactor;
  @JsonKey(defaultValue: 1)
  int maxLines;
  @JsonKey(defaultValue: TextOverflow.clip)
  TextOverflow overflow;

  TplText(
      {required this.text,
      this.style,
      this.textAlign = TextAlign.left,
      this.textDirection = TextDirection.ltr,
      this.softWrap = true,
      this.tightBounds = false,
      this.textScaleFactor = 1.0,
      this.maxLines = 1,
      this.overflow = TextOverflow.clip});

  factory TplText.fromJson(Map<String, dynamic> json) =>
      _$TplTextFromJson(json);

  Map<String, dynamic> toJson() => _$TplTextToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    var value = Text(
      _evaluateInput(text, data),
      style: TplTextStyle.to(style),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      tightBounds: tightBounds,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      overflow: overflow,
    );
    return value;
  }

  String _evaluateInput(TplString text, Map<String, dynamic> data) {
    if (text.value != null) {
      final evaluator = ExpressionEvaluator(memberAccessors: [
        MemberAccessor.mapAccessor,
      ]);
      dynamic res;
      final context = {
        'data': data,
      };
      try {
        res = evaluator.eval(
            Expression.parse(text.value!), Map<String, dynamic>.from(context));
      } catch (e) {
        return text.value!;
      }

      return res != null ? res!.toString() : text.value!;
    } else {
      return '';
    }
  }
}
