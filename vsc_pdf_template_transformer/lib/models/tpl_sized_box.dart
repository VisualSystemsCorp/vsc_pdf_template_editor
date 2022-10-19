import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_sized_box.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplSizedBox implements wb.WidgetBuilder {
  String className = 'TplSizedBox';
  @JsonKey()
  double? width;
  @JsonKey()
  double? height;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  TplSizedBox({
    this.width,
    this.height,
    this.child,
  });

  factory TplSizedBox.fromJson(Map<String, dynamic> json) =>
      _$TplSizedBoxFromJson(json);

  Map<String, dynamic> toJson() => _$TplSizedBoxToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    final value = SizedBox(
        width: TplString.evaluateDouble(width, data),
        height: TplString.evaluateDouble(height, data),
        child: child?.buildWidget(data));
    return value;
  }
}
