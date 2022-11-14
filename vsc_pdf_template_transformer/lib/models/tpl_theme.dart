import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_theme_data.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_theme.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTheme implements wb.WidgetBuilder {
  TplTheme();

  String className = 'TplTheme';

  TplThemeData? data;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplTheme.fromJson(Map<String, dynamic> json) =>
      _$TplThemeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplThemeToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Theme(data: this.data!.toPdf(data), child: child!.buildWidget(data));
  }
}
