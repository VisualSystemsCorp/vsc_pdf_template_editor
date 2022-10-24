import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_multi_page.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplMultiPage {
  TplMultiPage(this.children);

  String className = 'TplMultiPage';

  @WidgetJsonConverter()
  List<wb.WidgetBuilder?>? children;

  factory TplMultiPage.fromJson(Map<String, dynamic> json) =>
      _$TplMultiPageFromJson(json);

  Map<String, dynamic> toJson() => _$TplMultiPageToJson(this);

  pw.Page toPdf(Map<String, dynamic> data) {
    return pw.MultiPage(build: (pw.Context context) {
      return children == null
          ? []
          : children!
              .map((child) => child!.buildWidget(data))
              .toList(growable: false);
    });
  }
}
