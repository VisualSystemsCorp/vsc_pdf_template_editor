import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart' as pdfx;

import '../utils/json_to_pdf_document_parser.dart';

class W2 extends StatefulWidget {
  final String? json;

  const W2({Key? key, this.json}) : super(key: key);

  @override
  createState() => _W2State();
}

class _W2State extends State<W2> {
  @override
  Widget build(BuildContext context) {
    final pdfController = pdfx.PdfController(
        document: pdfx.PdfDocument.openData(
            JSONToPDFDocumentParser.getDocumentFromJSON(widget.json ??
                JSONToPDFDocumentParser.EMPTY_JSON_PLACEHOLDER)
                .save()));

    return Expanded(
        child: pdfx.PdfView(
          onDocumentLoaded: (value) {
            print('-- loaded OK: ${value.pagesCount} page(s) ----');
          },
          onDocumentError: (value) {
            print('-- loading error: ${value.toString()} ----');
          },
          controller: pdfController,
        ));
  }
}

class W2Page extends StatelessWidget {
  const W2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(36),
        child: Container(
          decoration: BoxDecoration(color: Colors.green),
          child: W2(
            json: 'Hello There Second Widget (Non-scalable PDF View Widget)',
          ),
        ));
  }
}
