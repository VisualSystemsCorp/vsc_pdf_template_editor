import 'package:expressions/expressions.dart';

class TplString {
  static String evaluateString(String? expression, Map<String, dynamic> data) {
    if (expression != null) {
      final evaluator = ExpressionEvaluator(memberAccessors: [
        MemberAccessor.mapAccessor,
      ]);
      dynamic res;
      final context = {
        'data': data,
      };
      try {
        res = evaluator.eval(
            Expression.parse(expression!), Map<String, dynamic>.from(context));
      } catch (e) {
        return expression!;
      }

      return res != null ? res!.toString() : expression!;
    } else {
      return '';
    }
  }

  static double? evaluateDouble(String? input, Map<String, dynamic> data) {
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
