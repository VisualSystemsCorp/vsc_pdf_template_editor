import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_polygon.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPolygon implements wb.WidgetBuilder {
  TplPolygon();

  String className = 'TplPolygon';
  List<TplPdfPoint>? points;
  dynamic fillColor;
  dynamic strokeColor;
  dynamic strokeWidth;
  dynamic close;

  factory TplPolygon.fromJson(Map<String, dynamic> json) =>
      _$TplPolygonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPolygonToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Polygon(
        points: getPdfPoints(points!, data),
        fillColor: evaluateColor(fillColor, data),
        strokeColor: evaluateColor(strokeColor, data),
        strokeWidth: evaluateDouble(strokeWidth, data) ?? 1.0,
        close: evaluateBool(close, data) ?? true);
  }
}