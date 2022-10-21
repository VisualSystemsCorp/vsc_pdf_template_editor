import 'package:expressions/expressions.dart';
import 'package:pdf/pdf.dart';

dynamic _evaluateDynamic(dynamic expression, Map<String, dynamic> data) {
  if (expression is! String) {
    return expression;
  }

  final evaluator = ExpressionEvaluator(memberAccessors: [
    MemberAccessor.mapAccessor,
  ]);

  return evaluator.eval(Expression.parse(expression.trim()), {
    'data': data,
  });
}

T nonNull<T>(T? value) {
  if (value == null) {
    throw Exception('Value required');
  }

  return value;
}

String? evaluateString(dynamic expression, Map<String, dynamic> data) {
  // Note expression strings containing a single word, such as "hello", return a null from the evaluator,
  // where "hello world" throws an exception.
  // Thus, all strings must be a valid expression and must be quoted.
  final result = _evaluateDynamic(expression, data);
  return result?.toString();
}

double? evaluateDouble(dynamic expression, Map<String, dynamic> data) {
  // Allow exceptions for invalid expressions to be thrown.
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is num) {
    return result.toDouble();
  }

  return double.tryParse(result.toString());
}

int? evaluateInt(dynamic expression, Map<String, dynamic> data) {
  // Allow exceptions for invalid expressions to be thrown.
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is num) {
    return result.toInt();
  }

  return int.tryParse(result.toString());
}

bool? evaluateBool(dynamic expression, Map<String, dynamic> data) {
  // Allow exceptions for invalid expressions to be thrown.
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is bool) {
    return result;
  }

  return result.toString().toLowerCase() == 'true';
}

PdfColor? evaluateColor(dynamic expression, Map<String, dynamic> data) {
  // Allow exceptions for invalid expressions to be thrown.
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  return PdfColor.fromHex(result.toString());
}

List<T>? evaluateList<T>(dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  return List<T>.from(result, growable: false);
}
