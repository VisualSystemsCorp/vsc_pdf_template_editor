import 'dart:math';
import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_container.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplContainer implements wb.WidgetBuilder {
  String className = 'TplContainer';
  @JsonKey()
  String? id;
  @JsonKey()
  TplString? width;
  @JsonKey()
  TplString? height;
  @JsonKey(defaultValue: null)
  TplBoxDecoration? decoration;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  TplContainer({
    this.id,
    this.width,
    this.height,
    this.decoration,
    this.child,
  }) {
    if (id == null) {
      id = _generateId();
    }
  }

  factory TplContainer.fromJson(Map<String, dynamic> json) =>
      _$TplContainerFromJson(json);

  Map<String, dynamic> toJson() => _$TplContainerToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    final value = Container(
        width: width?.evaluateDouble(width?.expression, data),
        height: height?.evaluateDouble(height?.expression, data),
        decoration: TplBoxDecoration.to(decoration),
        child: child?.buildWidget(data));
    return value;
  }

  String _generateId() {
    return Random().nextInt(4294967296).toString();
  }
}
