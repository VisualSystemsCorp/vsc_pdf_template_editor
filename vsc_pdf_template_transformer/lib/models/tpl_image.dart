import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

import '../utils/alignment.dart' as a;

part 'tpl_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplImage implements wb.WidgetBuilder {
  TplImage();

  String t = 'Image';
  dynamic image;
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
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    final imageProvider = await evaluateImageProvider(image, data);
    if (imageProvider == null) {
      throw Exception('"image" attribute is required');
    }

    return Image(imageProvider,
        fit: await evaluateBoxFit(fit, data) ?? BoxFit.contain,
        alignment: await alignment?.buildAlignment(data) ?? Alignment.center,
        width: await evaluateDouble(width, data),
        height: await evaluateDouble(height, data),
        dpi: await evaluateDouble(dpi, data));
  }
}
