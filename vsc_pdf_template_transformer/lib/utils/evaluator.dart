import 'package:expressions/expressions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

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

T? evaluateEnum<T extends Enum>(
    List<T> values, dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  return values.byName(result.toString());
}

Font? evaluateFont(dynamic expression, Map<String, dynamic> data) {
  final fontEnum = evaluateEnum(Type1Fonts.values, expression, data);
  if (fontEnum == null) {
    return null;
  }

  return Font.type1(fontEnum);
}

List<Font> evaluateFontList(
    List<dynamic>? expressions, Map<String, dynamic> data) {
  final List<Font> list = [];
  if (expressions != null && expressions.isNotEmpty) {
    for (final e in expressions) {
      final result = evaluateFont(e, data);
      if (result != null) {
        list.add(result);
      }
    }
  }
  return list;
}

TextDecoration? evaluateTextDecoration(
    dynamic expression, Map<String, dynamic> data) {
  if (expression is List && expression.isNotEmpty) {
    final List<TextDecoration> list = [];
    for (final e in expression) {
      final result = evaluateTextDecoration(e, data);
      if (result != null) {
        list.add(result);
      }
    }
    return TextDecoration.combine(list);
  }
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'none':
      return TextDecoration.none;
    case 'underline':
      return TextDecoration.underline;
    case 'overline':
      return TextDecoration.overline;
    case 'lineThrough':
      return TextDecoration.lineThrough;
    default:
      throw Exception('Invalid text decoration: $result');
  }
}

FontWeight? evaluateFontWeight(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(FontWeight.values, expression, data);
}

FontStyle? evaluateFontStyle(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(FontStyle.values, expression, data);
}

PdfTextRenderingMode? evaluatePdfTextRenderingMode(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfTextRenderingMode.values, expression, data);
}

TextAlign? evaluateTextAlign(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TextAlign.values, expression, data);
}

TextDirection? evaluateTextDirection(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TextDirection.values, expression, data);
}

TextOverflow? evaluateTextOverflow(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TextOverflow.values, expression, data);
}
