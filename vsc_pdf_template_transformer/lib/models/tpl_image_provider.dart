import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_memory_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_raw_image.dart';

part 'tpl_image_provider.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplImageProvider {
  TplImageProvider(this.providerData);

  Map<String, dynamic> providerData;

  factory TplImageProvider.fromJson(Map<String, dynamic> json) =>
      _$TplImageProviderFromJson(json);

  Map<String, dynamic> toJson() => _$TplImageProviderToJson(this);

  ImageProvider buildImage(Map<String, dynamic> data) {
    switch (providerData['className']) {
      case 'TplMemoryImage':
        return TplMemoryImage.fromJson(providerData).buildImage(data);
      case 'TplRawImage':
        return TplRawImage.fromJson(providerData).buildImage(data);
    }
    throw Exception('No image className or unknown image className');
  }
}
