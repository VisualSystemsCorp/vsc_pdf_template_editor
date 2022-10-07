import 'package:expressions/expressions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tpl_string.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
)
class TplString {
  TplString({
    this.expression = '',
  });

  String? expression;

  factory TplString.fromJson(Map<String, dynamic> json) =>
      _$TplStringFromJson(json);

  Map<String, dynamic> toJson() => _$TplStringToJson(this);

  String evaluateString(TplString text, Map<String, dynamic> data) {
    if (text.expression != null) {
      final evaluator = ExpressionEvaluator(memberAccessors: [
        MemberAccessor.mapAccessor,
      ]);
      dynamic res;
      final context = {
        'data': data,
      };
      try {
        res = evaluator.eval(Expression.parse(text.expression!),
            Map<String, dynamic>.from(context));
      } catch (e) {
        return text.expression!;
      }

      return res != null ? res!.toString() : text.expression!;
    } else {
      return '';
    }
  }

  double? evaluateDouble(String? input, Map<String, dynamic> data) {
    if (input != null && data.isNotEmpty) {
      final evaluator = ExpressionEvaluator(memberAccessors: [
        MemberAccessor.mapAccessor,
      ]);
      dynamic res;
      final context = {
        'data': data,
      };

      try {
        res = evaluator.eval(
            Expression.parse(input), Map<String, dynamic>.from(context));
        double? parsedRes;
        parsedRes = res != null ? double.parse(res!.toString()) : null;
        return parsedRes;
      } catch (e) {
        return double.tryParse(input);
      }
    } else
      return input != null ? double.parse(input) : null;
  }
}
