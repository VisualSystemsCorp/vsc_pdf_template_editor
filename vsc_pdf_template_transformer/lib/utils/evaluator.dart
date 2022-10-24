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

Font? evaluateFont(dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'courier':
      return Font.courier();
    case 'courierBold':
      return Font.courierBold();
    case 'courierBoldOblique':
      return Font.courierBoldOblique();
    case 'courierOblique':
      return Font.courierOblique();
    case 'helvetica':
      return Font.helvetica();
    case 'helveticaBold':
      return Font.helveticaBold();
    case 'helveticaBoldOblique':
      return Font.helveticaBoldOblique();
    case 'helveticaOblique':
      return Font.helveticaOblique();
    case 'times':
      return Font.times();
    case 'timesBold':
      return Font.timesBold();
    case 'timesBoldItalic':
      return Font.timesBoldItalic();
    case 'timesItalic':
      return Font.timesItalic();
    case 'symbol':
      return Font.symbol();
    case 'zapfDingbats':
      return Font.zapfDingbats();
    default:
      throw Exception('Invalid font: $result');
  }
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
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'normal':
      return FontWeight.normal;
    case 'bold':
      return FontWeight.bold;
    default:
      throw Exception('Invalid font weight: $result');
  }
}

FontStyle? evaluateFontStyle(dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'normal':
      return FontStyle.normal;
    case 'italic':
      return FontStyle.italic;
    default:
      throw Exception('Invalid font style: $result');
  }
}

PdfTextRenderingMode? evaluatePdfTextRenderingMode(
    dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'clip':
      return PdfTextRenderingMode.clip;
    case 'fill':
      return PdfTextRenderingMode.fill;
    case 'fillAndClip':
      return PdfTextRenderingMode.fillAndClip;
    case 'fillAndStroke':
      return PdfTextRenderingMode.fillAndStroke;
    case 'fillStrokeAndClip':
      return PdfTextRenderingMode.fillStrokeAndClip;
    case 'invisible':
      return PdfTextRenderingMode.invisible;
    case 'stroke':
      return PdfTextRenderingMode.stroke;
    case 'strokeAndClip':
      return PdfTextRenderingMode.strokeAndClip;
    default:
      throw Exception('Invalid text rendering mode: $result');
  }
}

TextAlign? evaluateTextAlign(dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'right':
      return TextAlign.right;
    case 'left':
      return TextAlign.left;
    case 'center':
      return TextAlign.center;
    case 'justify':
      return TextAlign.justify;
    default:
      throw Exception('Invalid text align: $result');
  }
}

TextDirection? evaluateTextDirection(
    dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'ltr':
      return TextDirection.ltr;
    case 'rtl':
      return TextDirection.rtl;
    default:
      throw Exception('Invalid text direction: $result');
  }
}

TextOverflow? evaluateTextOverflow(
    dynamic expression, Map<String, dynamic> data) {
  final result = _evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'clip':
      return TextOverflow.clip;
    case 'visible':
      return TextOverflow.visible;
    case 'span':
      return TextOverflow.span;
    default:
      throw Exception('Invalid text overflow: $result');
  }
}
