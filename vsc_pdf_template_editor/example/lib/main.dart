import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/vsc_pdf_template_editor.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const EditorApp());
}

class EditorApp extends StatefulWidget {
  const EditorApp({Key? key}) : super(key: key);

  @override
  State<EditorApp> createState() => _EditorAppState();
}

class _EditorAppState extends State<EditorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(colorSchemeSeed: const Color(0xFF6200EE)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.testAppName),
            ),
            body: FutureBuilder<List<Map<String, dynamic>>>(
                future: _loadData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return VscPdfTemplateEditor(
                      template: snapshot.data![0],
                      data: snapshot.data![1],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                })));
  }

  Future<List<Map<String, dynamic>>> _loadData() async {
    final sampleData = await _getSampleTemplate();
    final sampleContext = await _getData();
    return [sampleData, sampleContext];
  }

  Future<Map<String, dynamic>> _getSampleTemplate() async {
    final res = await rootBundle.loadString('assets/test/sample_text.json');
    final result = Map<String, dynamic>.from(json.decode(res));
    return result;
  }

  Future<Map<String, dynamic>> _getData() async {
    final res = await rootBundle.loadString('assets/test/sample_invoice.json');
    final result = Map<String, dynamic>.from(json.decode(res));
    return result;
  }
}
