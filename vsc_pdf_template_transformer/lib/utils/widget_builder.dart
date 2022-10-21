import 'package:pdf/widgets.dart' as pw;

abstract class WidgetBuilder {
  pw.Widget buildWidget(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
