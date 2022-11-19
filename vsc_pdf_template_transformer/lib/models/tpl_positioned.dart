import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_positioned.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPositioned implements wb.WidgetBuilder {
  TplPositioned();

  String className = 'TplPositioned';
  dynamic left;
  dynamic top;
  dynamic right;
  dynamic bottom;
  dynamic type;
  dynamic textDirection;
  dynamic start;
  dynamic end;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplPositioned.fromJson(Map<String, dynamic> json) =>
      _$TplPositionedFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPositionedToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    final positionedStr = await evaluateString(type, data);
    if (positionedStr == null) {
      return Positioned(
          left: await evaluateDouble(left, data),
          top: await evaluateDouble(top, data),
          right: await evaluateDouble(right, data),
          bottom: await evaluateDouble(bottom, data),
          child: await child?.buildWidget(data) ?? SizedBox());
    }

    switch (positionedStr) {
      case 'fill':
        return Positioned.fill(
            left: await evaluateDouble(left, data),
            top: await evaluateDouble(top, data),
            right: await evaluateDouble(right, data),
            bottom: await evaluateDouble(bottom, data),
            child: await child?.buildWidget(data) ?? SizedBox());
      case 'directional':
        return Positioned.directional(
            textDirection: await evaluateTextDirection(textDirection, data) ??
                TextDirection.ltr,
            start: await evaluateDouble(start, data),
            top: await evaluateDouble(top, data),
            end: await evaluateDouble(end, data),
            bottom: await evaluateDouble(bottom, data),
            child: await child?.buildWidget(data) ?? SizedBox());
      default:
        throw Exception('Invalid positioned: $positionedStr');
    }
  }
}
