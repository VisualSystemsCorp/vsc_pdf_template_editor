import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/image_provider_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import '../utils/image_provider.dart' as ip;
import '../utils/alignment.dart' as a;

part 'tpl_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplImage implements wb.WidgetBuilder {
  TplImage();

  String className = 'TplImage';
  @ImageProviderJsonConverter()
  ip.ImageProvider? image;
  dynamic fit;
  @AlignmentJsonConverter()
  a.Alignment? alignment;
  dynamic width;
  dynamic height;
  dynamic dpi;

  factory TplImage.fromJson(Map<String, dynamic> json) =>
      _$TplImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplImageToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Image(image!.buildImage(data),
        fit: evaluateBoxFit(fit, data) ?? BoxFit.contain,
        alignment: alignment?.buildAlignment(data) ?? Alignment.center,
        width: evaluateDouble(width, data),
        height: evaluateDouble(height, data),
        dpi: evaluateDouble(dpi, data));
  }
}
