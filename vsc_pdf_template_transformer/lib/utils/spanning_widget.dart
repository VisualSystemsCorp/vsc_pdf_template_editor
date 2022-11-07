import 'package:pdf/widgets.dart' as pw;

abstract class SpanningWidgetBuilder {
  pw.SpanningWidget buildWidget(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
