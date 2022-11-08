import 'package:pdf/widgets.dart' as pw;

abstract class InlineSpan {
  pw.InlineSpan buildInlineSpan(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
