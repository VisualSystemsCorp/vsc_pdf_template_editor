import 'dart:convert';
import 'dart:typed_data';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:expressions/expressions.dart';
import 'package:intl/intl.dart' as intl;
import 'package:timezone/timezone.dart' as tz;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_memory_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partition.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_chart_value.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_raw_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_repeater.dart';
import '../utils/table_column_width.dart' as tcw;
import '../vsc_pdf_template_transformer.dart';
import '../utils/inline_span.dart' as ins;
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

ExpressionEvaluator createExpressionEvaluator() {
  return ExpressionEvaluator(memberAccessors: [
    MemberAccessor.mapAccessor,
  ]);
}

/// Evaluate a dynamic expression, or constant non-string value. [addlContext] will
/// be added to the evaluation context. [data] will be in the context under the key
/// `data`.
dynamic evaluateDynamic(
  dynamic expression,
  Map<String, dynamic> data, {
  Map<String, dynamic> addlContext = const {},
}) {
  if (expression is! String) {
    return expression;
  }

  return createExpressionEvaluator().eval(Expression.parse(expression.trim()), {
    'data': data,
    ...addlContext,
    'formatLongCurrency': (dynamic value) => _formatLongCurrency(value, data),
    'formatCurrency': (dynamic value) => _formatCurrency(value, data),
    'formatPercent': (dynamic value, dynamic scale) =>
        _formatPercent(value, scale, data),
    'formatNumber': (String? pattern, dynamic value) =>
        _formatNumber(pattern, value, data),
    'formatDateTime': (dynamic pattern, dynamic value, [bool useTz = false]) =>
        _formatDateTime(pattern, value, useTz, data),
  });
}

/// Formats [value] into a date/time string using the given [pattern], and possibly
/// `data.$locale`. If [useTz] is true, the date/time will be formatted
/// with respect to the timezone specified in `data.$tz`. [pattern] can either be
/// a pattern format String, or an array of Strings whose formats are concatenated
/// with a space separator. The patterns must match https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html.
/// If you use multiple "skeleton" patterns, you must use an array. Because of
/// limitations with the intl package, you cannot say `'yMd jm'`. Instead you must
/// say `['ymd', 'jm']`.
String _formatDateTime(
    dynamic pattern, value, bool useTz, Map<String, dynamic> data) {
  if (value == null ||
      pattern == null ||
      (pattern is! String && pattern is! List)) {
    return '';
  }

  if (value is String) {
    // Convert ISO date to DateTime
    final parsedDateTime = DateTime.tryParse(value);
    if (parsedDateTime == null) {
      // Can't parse it, so just return the string value.
      return value.toString();
    }

    // Make sure DateTime value is expressed as isUtc == true. This can happen if
    // the string that was parsed did not contain a TZ. We want to assume that these values
    // are in UTC.
    if (parsedDateTime.isUtc) {
      value = parsedDateTime;
    } else {
      value = DateTime.utc(
        parsedDateTime.year,
        parsedDateTime.month,
        parsedDateTime.day,
        parsedDateTime.hour,
        parsedDateTime.minute,
        parsedDateTime.second,
        parsedDateTime.millisecond,
        parsedDateTime.microsecond,
      );
    }
  }

  if (value is DateTime) {
    if (useTz) {
      final location = _getTzLocation(data);
      // Convert DateTime (UTC) to TZDateTime in the given TZ.
      value = tz.TZDateTime.from(value, location);
    }
  } else {
    return value.toString();
  }

  final locale = _getLocale(data);
  final intl.DateFormat formatter;
  if (pattern is List) {
    formatter = intl.DateFormat(pattern[0], locale);
    for (var i = 1; i < pattern.length; i++) {
      formatter.addPattern(pattern[i]);
    }
  } else {
    formatter = intl.DateFormat(pattern, locale);
  }
  return formatter.format(value);
}

dynamic _maybeConvertStringToDecimal(dynamic value) {
  return value is String ? DecimalIntl(Decimal.parse(value)) : value;
}

String _formatLongCurrency(dynamic value, Map<String, dynamic> data) {
  if (value == null) return '';

  value = _maybeConvertStringToDecimal(value);
  final formatter = intl.NumberFormat.currency(locale: _getLocale(data));
  return formatter.format(value);
}

String _formatCurrency(dynamic value, Map<String, dynamic> data) {
  if (value == null) return '';

  value = _maybeConvertStringToDecimal(value);
  final formatter = intl.NumberFormat.simpleCurrency(locale: _getLocale(data));
  return formatter.format(value);
}

String _formatPercent(dynamic value, dynamic scale, Map<String, dynamic> data) {
  if (value == null) return '';

  value = _maybeConvertStringToDecimal(value);
  if (scale is num) scale = scale.toInt();
  final formatter = intl.NumberFormat.decimalPercentPattern(
      locale: _getLocale(data), decimalDigits: scale ?? 0);
  return formatter.format(value);
}

String _formatNumber(
    String? pattern, dynamic value, Map<String, dynamic> data) {
  if (value == null) return '';

  value = _maybeConvertStringToDecimal(value);
  final formatter = intl.NumberFormat(pattern, _getLocale(data));
  return formatter.format(value);
}

String _getLocale(Map<String, dynamic> data) {
  final locale = data[r'$locale'] as String?;
  return locale ?? 'en-US';
}

tz.Location _getTzLocation(Map<String, dynamic> data) {
  final zone = data[r'$tz'] as String?;
  return tz.getLocation(zone ?? 'UTC');
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
  final result = evaluateDynamic(expression, data);
  return result?.toString();
}

double? evaluateDouble(dynamic expression, Map<String, dynamic> data) {
  // Allow exceptions for invalid expressions to be thrown.
  final result = evaluateDynamic(expression, data);
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
  final result = evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is num) {
    return result.toInt();
  }

  return int.tryParse(result.toString());
}

num? evaluateNum(dynamic expression, Map<String, dynamic> data) {
  final result = evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is num) {
    return result;
  }

  return num.tryParse(result.toString());
}

bool? evaluateBool(dynamic expression, Map<String, dynamic> data) {
  // Allow exceptions for invalid expressions to be thrown.
  final result = evaluateDynamic(expression, data);
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
  final result = evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  return PdfColor.fromHex(result.toString());
}

Uint8List? evaluateBase64(dynamic expression, Map<String, dynamic> data) {
  final result = evaluateString(expression, data);
  if (result == null) {
    return null;
  }

  return Base64Decoder().convert(result);
}

List<T>? evaluateList<T>(dynamic expression, Map<String, dynamic> data) {
  final result = evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  return List<T>.from(result, growable: false);
}

T? evaluateEnum<T extends Enum>(
  List<T> values,
  dynamic expression,
  Map<String, dynamic> data, {
  bool throwIfNotFound = true,
}) {
  final result = evaluateDynamic(expression, data);
  if (result == null || result is! String) {
    if (throwIfNotFound && expression != null) {
      throw Exception(
          'Unknown enum value for $expression. Valid values are $values');
    }
    return null;
  }

  return values.byName(result.toString());
}

Font? evaluateFont(dynamic expression, Map<String, dynamic> data) {
  final fontEnum =
      evaluateEnum(Type1Fonts.values, expression, data, throwIfNotFound: false);
  if (fontEnum == null) {
    final maybePdfFont = evaluateDynamic(expression, data);
    if (maybePdfFont == null) {
      return null;
    }

    if (maybePdfFont is Font) {
      return maybePdfFont;
    }

    throw Exception('Unrecognized font name $expression');
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
  final result = evaluateDynamic(expression, data);
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

PageOrientation? evaluatePageOrientation(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PageOrientation.values, expression, data);
}

FlexFit? evaluateFlexFit(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(FlexFit.values, expression, data);
}

PdfImageOrientation? evaluatePdfImageOrientation(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfImageOrientation.values, expression, data);
}

StackFit? evaluateStackFit(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(StackFit.values, expression, data);
}

Overflow? evaluateOverflow(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(Overflow.values, expression, data);
}

BoxShape? evaluateBoxShape(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(BoxShape.values, expression, data);
}

PdfPageFormat? evaluatePageFormat(
    dynamic expression, Map<String, dynamic> data) {
  final result = evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  switch (result) {
    case 'a3':
      return PdfPageFormat.a3;
    case 'a4':
      return PdfPageFormat.a4;
    case 'a5':
      return PdfPageFormat.a5;
    case 'a6':
      return PdfPageFormat.a6;
    case 'letter':
      return PdfPageFormat.letter;
    case 'legal':
      return PdfPageFormat.legal;
    case 'roll57':
      return PdfPageFormat.roll57;
    case 'roll80':
      return PdfPageFormat.roll80;
    case 'undefined':
      return PdfPageFormat.undefined;
    case 'standard':
      return PdfPageFormat.standard;
    default:
      throw Exception('Invalid page format: $result');
  }
}

MainAxisAlignment? evaluateMainAxisAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(MainAxisAlignment.values, expression, data);
}

CrossAxisAlignment? evaluateCrossAxisAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(CrossAxisAlignment.values, expression, data);
}

PdfOutlineStyle? evaluateOutlineStyle(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfOutlineStyle.values, expression, data);
}

DecorationPosition? evaluateDecorationPosition(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(DecorationPosition.values, expression, data);
}

BoxFit? evaluateBoxFit(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(BoxFit.values, expression, data);
}

Axis? evaluateAxis(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(Axis.values, expression, data);
}

MainAxisSize? evaluateMainAxisSize(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(MainAxisSize.values, expression, data);
}

VerticalDirection? evaluateVerticalDirection(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(VerticalDirection.values, expression, data);
}

WrapAlignment? evaluateWrapAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(WrapAlignment.values, expression, data);
}

WrapCrossAlignment? evaluateWrapCrossAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(WrapCrossAlignment.values, expression, data);
}

TableCellVerticalAlignment? evaluateTableCellVerticalAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TableCellVerticalAlignment.values, expression, data);
}

TableWidth? evaluateTableWidth(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TableWidth.values, expression, data);
}

TileMode? evaluateTileMode(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TileMode.values, expression, data);
}

PdfFieldFlags? evaluatePdfFieldFlags(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfFieldFlags.values, expression, data);
}

PdfAnnotHighlighting? evaluatePdfAnnotHighlighting(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfAnnotHighlighting.values, expression, data);
}

PdfAnnotFlags? evaluatePdfAnnotFlags(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfAnnotFlags.values, expression, data);
}

PdfBorderStyle? evaluatePdfBorderStyle(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfBorderStyle.values, expression, data);
}

PdfVersion? evaluatePdfVersion(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfVersion.values, expression, data);
}

PdfPageMode? evaluatePdfPageMode(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfPageMode.values, expression, data);
}

PieLegendPosition? evaluatePieLegendPosition(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PieLegendPosition.values, expression, data);
}

ValuePosition? evaluateValuePosition(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(ValuePosition.values, expression, data);
}

BarcodeType? evaluateBarcodeType(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(BarcodeType.values, expression, data);
}

ImageProvider? evaluateImageProvider(
    dynamic expression, Map<String, dynamic> data) {
  if (expression == null) {
    return null;
  }

  if (expression is Map<String, dynamic>) {
    switch (expression['className']) {
      case 'TplMemoryImage':
        return TplMemoryImage.fromJson(expression).buildImage(data);
      case 'TplRawImage':
        return TplRawImage.fromJson(expression).buildImage(data);
    }
    throw Exception('No ImageProvider className or unknown image className');
  }

  final result = evaluateDynamic(expression, data);

  // It could be a concrete ImageProvider initialized from a variable.
  if (result is ImageProvider) {
    return result;
  }

  throw Exception('Invalid image provider');
}

List<Widget> getChildren(List<dynamic> children, Map<String, dynamic> data) {
  final List<Widget> res = [];

  for (final e in children) {
    if (e['className'] == 'TplRepeater') {
      final arr = TplRepeater.fromJson(e).toPdf(data);
      res.addAll(arr);
    } else {
      final widget = Transformer.getWidgetBuilder(e);

      res.add(widget.buildWidget(data));
    }
  }
  return res;
}

List<TableColumnWidth> getTableColumnWidths(
        List<tcw.TableColumnWidth?> children, Map<String, dynamic> data) =>
    children
        .map((tplWidth) =>
            tplWidth?.buildTableColumnWidth(data) ?? IntrinsicColumnWidth())
        .toList(growable: false);

List<PdfColor> getColors(List<dynamic> colors, Map<String, dynamic> data) {
  final List<PdfColor> res = [];

  for (final e in colors) {
    final color = evaluateColor(e, data);
    if (color != null) {
      res.add(color);
    }
  }
  return res;
}

List<Partition> getPartitions(
    List<TplPartition> children, Map<String, dynamic> data) {
  final List<Partition> res = [];

  for (final e in children) {
    res.add(e.buildWidget(data) as Partition);
  }
  return res;
}

List<InlineSpan> getInlineSpanChildren(
    List<ins.InlineSpan?> children, Map<String, dynamic> data) {
  final List<InlineSpan> res = [];

  for (final e in children) {
    if (e != null) {
      res.add(e.buildInlineSpan(data));
    }
  }
  return res;
}

List<PdfPoint> getPdfPoints(
    List<TplPdfPoint> children, Map<String, dynamic> data) {
  final List<PdfPoint> res = [];

  for (final e in children) {
    res.add(e.toPdf(data));
  }
  return res;
}

List<List<PdfPoint>> getListOfPdfPoints(
    List<List<TplPdfPoint>> children, Map<String, dynamic> data) {
  final List<List<PdfPoint>> res = [];

  for (final e in children) {
    res.add(getPdfPoints(e, data));
  }
  return res;
}

Set<PdfFieldFlags> getPdfFieldFlags(
    List<dynamic> children, Map<String, dynamic> data) {
  final Set<PdfFieldFlags> flags = {};

  for (final e in children) {
    final res = evaluatePdfFieldFlags(e, data);
    if (res != null) {
      flags.add(res);
    }
  }
  return flags;
}

Set<PdfAnnotFlags> getPdfAnnotFlags(
    List<dynamic> children, Map<String, dynamic> data) {
  final Set<PdfAnnotFlags> flags = {};

  for (final e in children) {
    final res = evaluatePdfAnnotFlags(e, data);
    if (res != null) {
      flags.add(res);
    }
  }
  return flags;
}

List<PointChartValue> getPointChartValues(
    List<TplPointChartValue> children, Map<String, dynamic> data) {
  final List<PointChartValue> res = [];

  for (final e in children) {
    res.add(e.toPdf(data));
  }
  return res;
}

List<Dataset> getDatasets(
    List<wb.WidgetBuilder?> children, Map<String, dynamic> data) {
  final List<Dataset> res = [];

  for (final e in children) {
    if (e != null) {
      res.add(e.buildWidget(data) as Dataset);
    }
  }
  return res;
}

/// Copies [data] and adds `$pageCount` and `$pageNumber` as integers from [context].
/// It also adds `$pageCountString` and `$pageNumberString` as strings. [data] is _not_
/// modified, instead a new data object is returned.
Map<String, dynamic> addPageInfoToData(
    Context context, Map<String, dynamic> data) {
  return {
    ...data,
    r'$pageNumber': context.pageNumber,
    r'$pageCount': context.pagesCount,
    r'$pageNumberString': context.pageNumber.toString(),
    r'$pageCountString': context.pagesCount.toString(),
  };
}

Map<String, dynamic> createDataForRepeatedItem({
  required Map<String, dynamic> itemData,
  required Map<String, dynamic> parentData,
  required int index,
}) {
  final newData = {
    ...itemData,
  };

  // Copy variables from parent.
  newData.addEntries(
      parentData.entries.where((entry) => entry.key.startsWith(r'$')));

  // Set these AFTER copying parent variables
  newData[r'$parentData'] = parentData;
  newData[r'$index'] = index;

  return newData;
}
