import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/vsc_pdf_template_editor.dart';

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
            body: const EditorWidget()));
  }
}
