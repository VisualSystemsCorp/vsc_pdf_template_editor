import 'package:pdf/widgets.dart' as ip;

abstract class ImageProvider {
  ip.ImageProvider buildImage(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
