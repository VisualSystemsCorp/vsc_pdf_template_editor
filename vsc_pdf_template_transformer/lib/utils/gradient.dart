import 'package:pdf/widgets.dart' as g;

abstract class Gradient {
  g.Gradient buildGradient(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
