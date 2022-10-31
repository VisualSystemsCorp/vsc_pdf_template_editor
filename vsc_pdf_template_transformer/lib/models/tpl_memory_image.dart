import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_memory_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplMemoryImage {
  TplMemoryImage(this.imageData);

  dynamic imageData;
  dynamic orientation;
  dynamic dpi;

  factory TplMemoryImage.fromJson(Map<String, dynamic> json) =>
      _$TplMemoryImageFromJson(json);

  Map<String, dynamic> toJson() => _$TplMemoryImageToJson(this);

  buildImage(Map<String, dynamic> data) {
    return MemoryImage(evaluateBase64(imageData, data) ?? Uint8List(0),
        orientation: evaluatePdfImageOrientation(orientation, data),
        dpi: evaluateDouble(dpi, data));
  }
}
