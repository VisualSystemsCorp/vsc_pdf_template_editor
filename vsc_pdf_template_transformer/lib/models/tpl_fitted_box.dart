import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_fit.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_fitted_box.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFittedBox implements wb.WidgetBuilder {
  TplFittedBox();

  String className = 'TplFittedBox';
  TplBoxFit? fit;
  TplAlignment? alignment;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplFittedBox.fromJson(Map<String, dynamic> json) =>
      _$TplFittedBoxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFittedBoxToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return FittedBox(
      fit: fit?.toPdf(data) ?? BoxFit.contain,
      alignment: alignment?.toPdf(data) ?? Alignment.center,
      child: child?.buildWidget(data),
    );
  }
}
