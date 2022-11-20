import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:expressions/expressions.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:vsc_pdf_template_transformer/models/tpl_memory_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_partition.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_chart_value.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_raw_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_repeater.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme_data.dart';
import 'package:vsc_pdf_template_transformer/src/fonts/gfonts.dart';
import 'package:vsc_pdf_template_transformer/src/network/cache.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

import '../utils/inline_span.dart' as ins;
import '../utils/table_column_width.dart' as tcw;
import '../vsc_pdf_template_transformer.dart';

ExpressionEvaluator _createAsyncExpressionEvaluator() {
  return ExpressionEvaluator.async(memberAccessors: [
    MemberAccessor.mapAccessor,
  ]);
}

/// Evaluate a dynamic expression, or constant non-string value (like a bool or num that was a literal in the JSON).
/// [addlContext] will be added to the evaluation context. [data] will be in the context under the key `data`.
Future<dynamic> evaluateDynamic(
  dynamic expression,
  Map<String, dynamic> data, {
  Map<String, dynamic> addlContext = const {},
}) async {
  if (expression is! String) {
    return expression;
  }

  print('evaluateDynamic START buildCache=${Zone.current[#buildCache]}');
  final parsedExpr = Expression.parse(expression.trim());
  final Stream result = _createAsyncExpressionEvaluator().eval(parsedExpr, {
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
    'newThemeWithFontSize': (ThemeData themeData, num fontSize) {
      return themeData.copyWith(
        defaultTextStyle:
            themeData.defaultTextStyle.copyWith(fontSize: fontSize.toDouble()),
      );
    },
    'toString': (dynamic value) => value.toString(),
    'downloadImage': (url) => downloadImage(url),
    'downloadUtf8String': (url) => downloadUtf8String(url),
    'getGoogleFont': (fontName) async {
      final googleFontFunction = googleFonts[fontName];
      if (googleFontFunction == null) {
        throw Exception('Unrecognized font name $fontName');
      }
      return googleFontFunction();
    },
    'defaultTheme': () => defaultTheme(),
    'getThemeFromGoogleFont': (fontFamilyName) async {
      final themeFunction = googleFontThemes[fontFamilyName];
      if (themeFunction == null) {
        throw Exception('Unrecognized theme font family name $fontFamilyName');
      }
      return themeFunction();
    },
  });

  final value = await result.single;
  print('evaluateDynamic END buildCache=${Zone.current[#buildCache]}');
  return value;
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

/// Evaluates [expression] into a String or null. If [expression] wants to return a literal string,
/// it must be quoted, e.g., [expression] would be `"'test'"` to return the literal string "test".
Future<String?> evaluateString(
    dynamic expression, Map<String, dynamic> data) async {
  // Note expression strings containing a single word, such as "hello", return a null from the evaluator,
  // where "hello world" throws an exception.
  // Thus, all strings must be a valid expression and must be quoted.
  final result = await evaluateDynamic(expression, data);
  return result?.toString();
}

/// Like [evaluateString], but returns an empty string if the result is `null`.
Future<String> evaluateText(
    dynamic expression, Map<String, dynamic> data) async {
  return (await evaluateString(expression, data)) ?? '';
}

Future<double?> evaluateDouble(
    dynamic expression, Map<String, dynamic> data) async {
  // Allow exceptions for invalid expressions to be thrown.
  final result = await evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is num) {
    return result.toDouble();
  }

  return double.tryParse(result.toString());
}

Future<int?> evaluateInt(dynamic expression, Map<String, dynamic> data) async {
  // Allow exceptions for invalid expressions to be thrown.
  final result = await evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is num) {
    return result.toInt();
  }

  return int.tryParse(result.toString());
}

Future<num?> evaluateNum(dynamic expression, Map<String, dynamic> data) async {
  final result = await evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is num) {
    return result;
  }

  return num.tryParse(result.toString());
}

Future<bool?> evaluateBool(
    dynamic expression, Map<String, dynamic> data) async {
  // Allow exceptions for invalid expressions to be thrown.
  final result = await evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }
  if (result is bool) {
    return result;
  }

  return result.toString().toLowerCase() == 'true';
}

Future<DateTime?> evaluateDateTime(
    dynamic expression, Map<String, dynamic> data) async {
  final dateStr = await evaluateString(expression, data);
  return dateStr != null ? DateTime.parse(dateStr) : null;
}

Future<PdfColor?> evaluateColor(
    dynamic expression, Map<String, dynamic> data) async {
  // Allow exceptions for invalid expressions to be thrown.
  final result = await evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  return PdfColor.fromHex(result.toString());
}

Future<Uint8List?> evaluateBase64(
    dynamic expression, Map<String, dynamic> data) async {
  final result = await evaluateString(expression, data);
  if (result == null) {
    return null;
  }

  return Base64Decoder().convert(result);
}

Future<List<T>?> evaluateList<T>(
    dynamic expression, Map<String, dynamic> data) async {
  final result = await evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  return List<T>.from(result, growable: false);
}

Future<T?> evaluateEnum<T extends Enum>(
  List<T> values,
  dynamic expression,
  Map<String, dynamic> data, {
  bool throwIfNotFound = true,
}) async {
  final result = await evaluateDynamic(expression, data);
  if (result == null || result is! String) {
    if (throwIfNotFound && expression != null) {
      throw Exception(
          'Unknown enum value for $expression. Valid values are $values');
    }
    return null;
  }

  return values.byName(result.toString());
}

Future<Font?> evaluateFont(
    dynamic expression, Map<String, dynamic> data) async {
  final fontEnum = await evaluateEnum(Type1Fonts.values, expression, data,
      throwIfNotFound: false);
  if (fontEnum == null) {
    final maybePdfFont = await evaluateDynamic(expression, data);
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

Future<List<Font>> evaluateFontList(
    List<dynamic>? expressions, Map<String, dynamic> data) async {
  final List<Font> list = [];
  if (expressions != null && expressions.isNotEmpty) {
    for (final e in expressions) {
      final result = await evaluateFont(e, data);
      if (result != null) {
        list.add(result);
      }
    }
  }
  return list;
}

Future<TextDecoration?> evaluateTextDecoration(
    dynamic expression, Map<String, dynamic> data) async {
  if (expression is List && expression.isNotEmpty) {
    final List<TextDecoration> list = [];
    for (final e in expression) {
      final result = await evaluateTextDecoration(e, data);
      if (result != null) {
        list.add(result);
      }
    }
    return TextDecoration.combine(list);
  }

  final result = await evaluateDynamic(expression, data);
  switch (result) {
    case 'none':
      return TextDecoration.none;
    case 'underline':
      return TextDecoration.underline;
    case 'overline':
      return TextDecoration.overline;
    case 'lineThrough':
      return TextDecoration.lineThrough;
    case null:
      return null;
    default:
      throw Exception('Invalid text decoration: $result');
  }
}

Future<FontWeight?> evaluateFontWeight(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(FontWeight.values, expression, data);
}

Future<FontStyle?> evaluateFontStyle(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(FontStyle.values, expression, data);
}

Future<PdfTextRenderingMode?> evaluatePdfTextRenderingMode(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfTextRenderingMode.values, expression, data);
}

Future<TextAlign?> evaluateTextAlign(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TextAlign.values, expression, data);
}

Future<TextDirection?> evaluateTextDirection(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TextDirection.values, expression, data);
}

Future<TextOverflow?> evaluateTextOverflow(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TextOverflow.values, expression, data);
}

Future<PageOrientation?> evaluatePageOrientation(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PageOrientation.values, expression, data);
}

Future<FlexFit?> evaluateFlexFit(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(FlexFit.values, expression, data);
}

Future<PdfImageOrientation?> evaluatePdfImageOrientation(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfImageOrientation.values, expression, data);
}

Future<StackFit?> evaluateStackFit(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(StackFit.values, expression, data);
}

Future<Overflow?> evaluateOverflow(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(Overflow.values, expression, data);
}

Future<BoxShape?> evaluateBoxShape(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(BoxShape.values, expression, data);
}

Future<PdfPageFormat?> evaluatePageFormat(
    dynamic expression, Map<String, dynamic> data) async {
  final result = await evaluateDynamic(expression, data);
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
    case null:
      return null;
    default:
      throw Exception('Invalid page format: $result');
  }
}

Future<MainAxisAlignment?> evaluateMainAxisAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(MainAxisAlignment.values, expression, data);
}

Future<CrossAxisAlignment?> evaluateCrossAxisAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(CrossAxisAlignment.values, expression, data);
}

Future<PdfOutlineStyle?> evaluateOutlineStyle(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfOutlineStyle.values, expression, data);
}

Future<DecorationPosition?> evaluateDecorationPosition(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(DecorationPosition.values, expression, data);
}

Future<BoxFit?> evaluateBoxFit(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(BoxFit.values, expression, data);
}

Future<Axis?> evaluateAxis(dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(Axis.values, expression, data);
}

Future<MainAxisSize?> evaluateMainAxisSize(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(MainAxisSize.values, expression, data);
}

Future<VerticalDirection?> evaluateVerticalDirection(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(VerticalDirection.values, expression, data);
}

Future<WrapAlignment?> evaluateWrapAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(WrapAlignment.values, expression, data);
}

Future<WrapCrossAlignment?> evaluateWrapCrossAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(WrapCrossAlignment.values, expression, data);
}

Future<TableCellVerticalAlignment?> evaluateTableCellVerticalAlignment(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TableCellVerticalAlignment.values, expression, data);
}

Future<TableWidth?> evaluateTableWidth(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TableWidth.values, expression, data);
}

Future<TileMode?> evaluateTileMode(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TileMode.values, expression, data);
}

Future<PdfFieldFlags?> evaluatePdfFieldFlags(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfFieldFlags.values, expression, data);
}

Future<PdfAnnotHighlighting?> evaluatePdfAnnotHighlighting(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfAnnotHighlighting.values, expression, data);
}

Future<PdfAnnotFlags?> evaluatePdfAnnotFlags(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfAnnotFlags.values, expression, data);
}

Future<PdfBorderStyle?> evaluatePdfBorderStyle(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfBorderStyle.values, expression, data);
}

Future<PdfVersion?> evaluatePdfVersion(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfVersion.values, expression, data);
}

Future<PdfPageMode?> evaluatePdfPageMode(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PdfPageMode.values, expression, data);
}

Future<PieLegendPosition?> evaluatePieLegendPosition(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(PieLegendPosition.values, expression, data);
}

Future<ValuePosition?> evaluateValuePosition(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(ValuePosition.values, expression, data);
}

Future<BarcodeType?> evaluateBarcodeType(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(BarcodeType.values, expression, data);
}

Future<TextDecorationStyle?> evaluateTextDecorationStyle(
    dynamic expression, Map<String, dynamic> data) {
  return evaluateEnum(TextDecorationStyle.values, expression, data);
}

Future<ImageProvider?> evaluateImageProvider(
    dynamic expression, Map<String, dynamic> data) async {
  if (expression == null) {
    return null;
  }

  if (expression is Map<String, dynamic>) {
    final className = expression['className'];
    switch (className) {
      case 'TplMemoryImage':
        return TplMemoryImage.fromJson(expression).buildImage(data);
      case 'TplRawImage':
        return TplRawImage.fromJson(expression).buildImage(data);
    }
    throw Exception('Unknown image provider className: $className');
  }

  final result = await evaluateDynamic(expression, data);

  // It could be a concrete ImageProvider initialized from a variable.
  if (result is ImageProvider) {
    return result;
  }

  throw Exception('Invalid image provider');
}

Future<ThemeData?> evaluateThemeData(
    dynamic expression, Map<String, dynamic> data) async {
  final result = await evaluateDynamic(expression, data);
  if (result == null) {
    return null;
  }

  if (result is Map<String, dynamic>) {
    final className = expression['className'];
    if (className == 'TplThemeData') {
      return TplThemeData.fromJson(expression).toPdf(data);
    }

    throw Exception('Unknown ThemeData className: $className');
  }

  if (result is ThemeData) {
    return result;
  }

  throw Exception('Invalid ThemeData');
}

Future<List<Widget>> getChildren(
    List<dynamic> children, Map<String, dynamic> data) async {
  final List<Widget> res = [];

  for (final child in children) {
    if (child['className'] == 'TplRepeater') {
      final arr = await TplRepeater.fromJson(child).toPdf(data);
      res.addAll(arr);
    } else {
      final widgetBuilder = Transformer.getWidgetBuilder(child);
      res.add(await widgetBuilder.buildWidget(data));
    }
  }
  return res;
}

Future<List<TableColumnWidth>> getTableColumnWidths(
    List<tcw.TableColumnWidth?> children, Map<String, dynamic> data) async {
  final List<TableColumnWidth> result = [];
  for (final child in children) {
    result.add(
        await child?.buildTableColumnWidth(data) ?? IntrinsicColumnWidth());
  }
  return result;
}

Future<List<PdfColor>> getColors(
    List<dynamic> colors, Map<String, dynamic> data) async {
  final List<PdfColor> res = [];

  for (final colorExpr in colors) {
    final color = await evaluateColor(colorExpr, data);
    if (color != null) {
      res.add(color);
    }
  }
  return res;
}

Future<List<Partition>> getPartitions(
    List<TplPartition> children, Map<String, dynamic> data) async {
  final List<Partition> res = [];

  for (final child in children) {
    res.add(await child.buildWidget(data) as Partition);
  }
  return res;
}

Future<List<InlineSpan>> getInlineSpanChildren(
    List<ins.InlineSpan?> children, Map<String, dynamic> data) async {
  final List<InlineSpan> res = [];

  for (final child in children) {
    if (child != null) {
      res.add(await child.buildInlineSpan(data));
    }
  }
  return res;
}

Future<List<PdfPoint>> getPdfPoints(
    List<TplPdfPoint> children, Map<String, dynamic> data) async {
  final List<PdfPoint> res = [];
  for (final child in children) {
    res.add(await child.toPdf(data));
  }
  return res;
}

Future<List<List<PdfPoint>>> getListOfPdfPoints(
    List<List<TplPdfPoint>> children, Map<String, dynamic> data) async {
  final List<List<PdfPoint>> res = [];

  for (final child in children) {
    res.add(await getPdfPoints(child, data));
  }
  return res;
}

Future<Set<PdfFieldFlags>> getPdfFieldFlags(
    List<dynamic> children, Map<String, dynamic> data) async {
  final Set<PdfFieldFlags> flags = {};

  for (final child in children) {
    final res = await evaluatePdfFieldFlags(child, data);
    if (res != null) {
      flags.add(res);
    }
  }
  return flags;
}

Future<Set<PdfAnnotFlags>> getPdfAnnotFlags(
    List<dynamic> children, Map<String, dynamic> data) async {
  final Set<PdfAnnotFlags> flags = {};

  for (final child in children) {
    final res = await evaluatePdfAnnotFlags(child, data);
    if (res != null) {
      flags.add(res);
    }
  }
  return flags;
}

Future<List<PointChartValue>> getPointChartValues(
    List<TplPointChartValue> children, Map<String, dynamic> data) async {
  final List<PointChartValue> res = [];

  for (final child in children) {
    res.add(await child.toPdf(data));
  }
  return res;
}

Future<List<Dataset>> getDatasets(
    List<wb.WidgetBuilder?> children, Map<String, dynamic> data) async {
  final List<Dataset> res = [];

  for (final child in children) {
    if (child != null) {
      res.add(await child.buildWidget(data) as Dataset);
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
