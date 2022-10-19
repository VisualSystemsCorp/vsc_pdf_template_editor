import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_constraints.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
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
  TplAlignment? alignment;
  TplEdgeInsets? padding;
  @JsonKey(defaultValue: null)
  String? color;

  @JsonKey(defaultValue: null)
  TplBoxDecoration? decoration;
  @JsonKey(defaultValue: null)
  TplBoxDecoration? foregroundDecoration;
  @JsonKey()
  double? width;
  @JsonKey()
  double? height;

  // @JsonKey(defaultValue: null)
  //TplBoxConstraints? constraints;
  TplEdgeInsets? margin;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  TplContainer({
    this.alignment = const TplAlignment(),
    this.padding = const TplEdgeInsets(),
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    // this.constraints,
    this.margin = const TplEdgeInsets(),
    this.child,
  });

  factory TplContainer.fromJson(Map<String, dynamic> json) =>
      _$TplContainerFromJson(json);

  Map<String, dynamic> toJson() => _$TplContainerToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    final value = Container(
        alignment: TplAlignment.to(alignment),
        padding: TplEdgeInsets.to(padding),
        color: color != null ? PdfColor.fromHex(color!) : null,
        decoration: TplBoxDecoration.to(decoration),
        foregroundDecoration: TplBoxDecoration.to(foregroundDecoration),
        width: TplString.evaluateDouble(width, data),
        height: TplString.evaluateDouble(height, data),
        //   constraints: constraints,
        margin: TplEdgeInsets.to(margin),
        child: child?.buildWidget(data));
    return value;
  }
}
