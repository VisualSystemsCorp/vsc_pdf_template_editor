import 'package:pdf/widgets.dart' as pw;

abstract class InlineSpan {
  Future<pw.InlineSpan> buildInlineSpan(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
