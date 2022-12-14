import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';

import '../utils/widget_builder.dart' as wb;

part 'tpl_table_of_content.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTableOfContent implements wb.WidgetBuilder {
  TplTableOfContent();

  String t = 'TableOfContent';

  factory TplTableOfContent.fromJson(Map<String, dynamic> json) =>
      _$TplTableOfContentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTableOfContentToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return TableOfContent();
  }
}
