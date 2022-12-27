import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:vsc_pdf_template_editor/src/stores/view_model.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class PdfViewWidget extends StatelessWidget {
  const PdfViewWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (c) {
      if (viewModel.pdfBytes == null || viewModel.pdfBytes!.isEmpty) {
        return const Center(
          child: Text(AppStrings.addWidget),
        );
      } else {
        return PdfPreview(
          canChangePageFormat: false,
          canChangeOrientation: false,
          build: (PdfPageFormat format) {
            return viewModel.pdfBytes!;
          },
        );
      }
    });
  }
}
