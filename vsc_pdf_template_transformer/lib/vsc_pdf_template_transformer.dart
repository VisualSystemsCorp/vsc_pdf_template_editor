/// Support for doing something awesome.
///
/// More dartdocs go here.
library vsc_pdf_template_transformer;

export 'src/vsc_pdf_template_transformer_base.dart';

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'utils/node.dart';
import 'utils/widget_builder.dart';
// TODO: Export any libraries intended for clients of this package.
class Transformer {

  static pw.Document buildPdf(Node<String> treeRoot, Map<String, dynamic> data) {

    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {

          dynamic proxy = json.decode(treeRoot.value);

          return pw.Center(
            child: (proxy as WidgetBuilder).buildWidget(),
          ); // Center
        }));
    return pdf;
  }

}

