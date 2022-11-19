import 'package:pdf/widgets.dart' as pw;

abstract class WidgetBuilder {
  Future<pw.Widget> buildWidget(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
