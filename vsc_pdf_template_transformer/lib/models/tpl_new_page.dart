import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_new_page.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplNewPage implements wb.WidgetBuilder {
  TplNewPage();

  String className = 'TplNewPage';

  factory TplNewPage.fromJson(Map<String, dynamic> json) =>
      _$TplNewPageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplNewPageToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return NewPage();
  }
}
