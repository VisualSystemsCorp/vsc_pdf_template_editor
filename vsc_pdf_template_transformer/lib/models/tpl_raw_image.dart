import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/image_provider.dart' as ip;

part 'tpl_raw_image.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRawImage implements ip.ImageProvider {
  TplRawImage(this.imageData);

  String t = 'RawImage';
  dynamic imageData;
  dynamic width;
  dynamic height;
  dynamic orientation;
  dynamic dpi;

  factory TplRawImage.fromJson(Map<String, dynamic> json) =>
      _$TplRawImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRawImageToJson(this);

  @override
  Future<ImageProvider> buildImage(Map<String, dynamic> data) async {
    return RawImage(
      bytes: await evaluateBase64(imageData, data) ?? Uint8List(0),
      width: await evaluateInt(width, data) ?? 0,
      height: await evaluateInt(height, data) ?? 0,
      orientation: await evaluatePdfImageOrientation(orientation, data),
      dpi: await evaluateDouble(dpi, data),
    );
  }
}
