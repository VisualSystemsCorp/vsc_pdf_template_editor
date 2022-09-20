import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class PdfViewWidget extends StatelessWidget {
  const PdfViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.addWidget),
    );
  }
}
