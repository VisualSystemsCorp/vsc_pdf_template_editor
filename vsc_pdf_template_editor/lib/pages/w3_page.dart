import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class W3 extends StatefulWidget {
  final String? json;

  const W3(
      {Key? key,
        this.json})
      : super(key: key);

  @override
  createState() => _W3State();
}

class _W3State extends State<W3> {

  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World 3"),
          ); // Center
        }));
    return FutureBuilder(
        future: pdf.save(),
        builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Container();
    } else return const Center(
        child: SizedBox(
            child: CircularProgressIndicator(),
            width: 100,
            height: 100));
        });
  }
}

class W3Page extends StatelessWidget {
  const W3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(36),
        child: Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(children: [
              W3(
                json: '',
              ),
            ])));
  }
}
