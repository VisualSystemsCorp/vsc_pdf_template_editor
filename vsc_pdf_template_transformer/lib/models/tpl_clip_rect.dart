import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_clip_rect.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplClipRect implements wb.WidgetBuilder {
  TplClipRect();

  String className = 'TplClipRect';
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplClipRect.fromJson(Map<String, dynamic> json) =>
      _$TplClipRectFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplClipRectToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return ClipRect(child: await child?.buildWidget(data));
  }
}
