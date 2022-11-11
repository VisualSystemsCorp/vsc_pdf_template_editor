import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_barcode.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBarcode {
  TplBarcode();

  String className = 'TplBarcode';

  dynamic type;

  factory TplBarcode.fromJson(Map<String, dynamic> json) =>
      _$TplBarcodeFromJson(json);

  Map<String, dynamic> toJson() => _$TplBarcodeToJson(this);

  Barcode buildBarcode(Map<String, dynamic> data) {
    final barcodeStr = evaluateString(type, data);
    switch (barcodeStr) {
      case 'code39':
        return Barcode.code39();
      case 'code93':
        return Barcode.code93();
      case 'code128':
        return Barcode.code128();
      case 'gs128':
        return Barcode.gs128();
      case 'itf':
        return Barcode.itf();
      case 'itf14':
        return Barcode.itf14();
      case 'itf16':
        return Barcode.itf16();
      case 'ean13':
        return Barcode.ean13();
      case 'ean8':
        return Barcode.ean8();
      case 'ean5':
        return Barcode.ean5();
      case 'ean2':
        return Barcode.ean2();
      case 'isbn':
        return Barcode.isbn();
      case 'upca':
        return Barcode.upcA();
      case 'upce':
        return Barcode.upcE();
      case 'telepen':
        return Barcode.telepen();
      case 'codabar':
        return Barcode.codabar();
      case 'rm4scc':
        return Barcode.rm4scc();
      case 'qrCode':
        return Barcode.qrCode();
      case 'pdf417':
        return Barcode.pdf417();
      case 'dataMatrix':
        return Barcode.dataMatrix();
      case 'aztec':
        return Barcode.aztec();
      default:
        throw Exception('Invalid barcode type: $barcodeStr');
    }
  }
}
