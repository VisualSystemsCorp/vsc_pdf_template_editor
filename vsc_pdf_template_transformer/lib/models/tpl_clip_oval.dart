import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_clip_oval.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplClipOval implements wb.WidgetBuilder {
  TplClipOval();

  String className = 'TplClipOval';
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplClipOval.fromJson(Map<String, dynamic> json) =>
      _$TplClipOvalFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplClipOvalToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return ClipOval(child: child?.buildWidget(data));
  }
}
