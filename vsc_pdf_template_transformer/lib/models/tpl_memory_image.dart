import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/image_provider.dart' as ip;

part 'tpl_memory_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplMemoryImage implements ip.ImageProvider {
  TplMemoryImage(this.imageData);

  String className = 'TplMemoryImage';
  dynamic imageData;
  dynamic orientation;
  dynamic dpi;

  factory TplMemoryImage.fromJson(Map<String, dynamic> json) =>
      _$TplMemoryImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplMemoryImageToJson(this);

  @override
  buildImage(Map<String, dynamic> data) {
    return MemoryImage(evaluateBase64(imageData, data) ?? Uint8List(0),
        orientation: evaluatePdfImageOrientation(orientation, data),
        dpi: await evaluateDouble(dpi, data));
  }
}
