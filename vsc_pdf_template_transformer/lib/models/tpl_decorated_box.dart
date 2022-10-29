import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_decorated_box.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplDecoratedBox implements wb.WidgetBuilder {
  TplDecoratedBox();

  String className = 'TplDecoratedBox';
  TplBoxDecoration? decoration;
  dynamic position;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplDecoratedBox.fromJson(Map<String, dynamic> json) =>
      _$TplDecoratedBoxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplDecoratedBoxToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return DecoratedBox(
      decoration: decoration?.toPdf(data) ?? BoxDecoration(),
      position: evaluateDecorationPosition(position, data) ??
          DecorationPosition.background,
      child: child?.buildWidget(data),
    );
  }
}
