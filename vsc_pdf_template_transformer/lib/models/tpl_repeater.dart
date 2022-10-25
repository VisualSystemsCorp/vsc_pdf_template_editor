import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_repeater.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRepeater {
  String className = 'TplRepeater';

  @WidgetJsonConverter()
  List<wb.WidgetBuilder?>? array;
  @WidgetJsonConverter()
  wb.WidgetBuilder? childTemplate;

  TplRepeater();

  factory TplRepeater.fromJson(Map<String, dynamic> json) =>
      _$TplRepeaterFromJson(json);

  Map<String, dynamic> toJson() => _$TplRepeaterToJson(this);

  List<Widget> toPdf(Map<String, dynamic> data) {
    return array!
        .map((child) => child!.buildWidget(data))
        .toList(growable: false);
  }
}
