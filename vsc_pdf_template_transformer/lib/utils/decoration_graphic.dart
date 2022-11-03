import 'package:pdf/widgets.dart' as dg;

abstract class DecorationGraphic {
  dg.DecorationGraphic buildDecorationImage(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
