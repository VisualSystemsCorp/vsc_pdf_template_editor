import 'package:pdf/widgets.dart' as a;

abstract class Alignment {
  a.Alignment buildAlignment(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
