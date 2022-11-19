import 'package:pdf/widgets.dart' as ip;

abstract class ImageProvider {
  Future<ip.ImageProvider> buildImage(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
