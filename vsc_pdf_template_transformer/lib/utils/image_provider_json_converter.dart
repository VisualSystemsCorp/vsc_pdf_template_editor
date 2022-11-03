import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_memory_image.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_raw_image.dart';
import '../utils/image_provider.dart' as ip;

class ImageProviderJsonConverter
    extends JsonConverter<ip.ImageProvider?, Map<String, dynamic>?> {
  const ImageProviderJsonConverter();

  @override
  ip.ImageProvider? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['className']) {
        case 'TplMemoryImage':
          return TplMemoryImage.fromJson(json);
        case 'TplRawImage':
          return TplRawImage.fromJson(json);
      }
      throw Exception('No image className or unknown image className');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ip.ImageProvider? object) {
    return object?.toJson();
  }
}
