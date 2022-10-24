import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_page.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPage {
  TplPage(this.child);

  String className = 'TplPage';

  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplPage.fromJson(Map<String, dynamic> json) =>
      _$TplPageFromJson(json);

  Map<String, dynamic> toJson() => _$TplPageToJson(this);

  pw.Page toPdf(Map<String, dynamic> data) {
    return pw.Page(build: (pw.Context context) {
      return child?.buildWidget(data) ?? pw.SizedBox();
    });
  }
}
