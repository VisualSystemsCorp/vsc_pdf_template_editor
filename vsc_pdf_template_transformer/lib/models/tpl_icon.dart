import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_icon_data.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_icon.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplIcon implements wb.WidgetBuilder {
  TplIcon();

  String className = 'TplIcon';

  TplIconData? iconData;
  dynamic size;
  dynamic color;
  dynamic textDirection;
  dynamic font;

  factory TplIcon.fromJson(Map<String, dynamic> json) =>
      _$TplIconFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplIconToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Icon(iconData!.toPdf(data),
        size: await evaluateDouble(size, data),
        color: await evaluateColor(color, data),
        textDirection: evaluateTextDirection(textDirection, data),
        font: evaluateFont(font, data));
  }
}
