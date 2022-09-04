import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart' as pdfx;

import '../utils/json_to_pdf_document_parser.dart';

class W1 extends StatefulWidget {
  final String? json;

  const W1({Key? key, this.json}) : super(key: key);

  @override
  createState() => _W1State();
}

class _W1State extends State<W1> {
  @override
  Widget build(BuildContext context) {
    final pdfPinchController = pdfx.PdfControllerPinch(
        document: pdfx.PdfDocument.openData(
            JSONToPDFDocumentParser.getDocumentFromJSON(widget.json ??
                    JSONToPDFDocumentParser.EMPTY_JSON_PLACEHOLDER)
                .save()));

    return pdfx.PdfViewPinch(
      onDocumentLoaded: (value) {
        print('-- loaded OK: ${value.pagesCount} page(s) ----');
      },
      onDocumentError: (value) {
        print('-- loading error: ${value.toString()} ----');
      },
      controller: pdfPinchController,
    );
  }
}

class W1Page extends StatelessWidget {
  const W1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(36),
        child: Container(
            decoration: BoxDecoration(color: Colors.red),
            child: W1(
                json: 'Hello There First Widget (Scalable PDF View Widget)',
              ),
            ));
  }
}
