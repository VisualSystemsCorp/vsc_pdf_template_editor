import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class JSONToPDFDocumentParser {

  static String EMPTY_JSON_PLACEHOLDER = "No Data";

  static pw.Document getDocumentFromJSON(String json_string) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(json_string),
          ); // Center
        }));
    return pdf;
  }

}