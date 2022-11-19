import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_constraints.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_constrained_box.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplConstrainedBox implements wb.WidgetBuilder {
  TplConstrainedBox();

  String className = 'TplConstrainedBox';
  TplBoxConstraints? constraints;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplConstrainedBox.fromJson(Map<String, dynamic> json) =>
      _$TplConstrainedBoxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplConstrainedBoxToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return ConstrainedBox(
      constraints: constraints?.toPdf(data) ?? BoxConstraints(),
      child: await child?.buildWidget(data),
    );
  }
}
