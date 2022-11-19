import 'package:pdf/widgets.dart' as g;

abstract class Gradient {
  Future<g.Gradient> buildGradient(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
