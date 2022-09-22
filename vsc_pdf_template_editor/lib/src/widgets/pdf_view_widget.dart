import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/tree_store.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfViewWidget extends StatelessWidget {
  const PdfViewWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final TreeStore viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (c) {
      if (viewModel.pdfBytes.isEmpty) {
        return const Center(
          child: Text(AppStrings.addWidget),
        );
      } else {
        return PdfPreview(
          build: (PdfPageFormat format) {
            return viewModel.pdfBytes;
          },
        );
      }
    });
  }
}
