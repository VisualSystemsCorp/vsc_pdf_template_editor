import 'package:json_annotation/json_annotation.dart';
//import 'package:pdf/src/widgets/widget.dart' as wp;
import 'package:pdf/widgets.dart';

import '../utils/widget_builder.dart' as wb;
import '../utils/extensions.dart';
import 'text_style.dart' as ts;

part 'text_pdf.g.dart';

@JsonSerializable()
class TextPdf implements wb.WidgetBuilder {

  String className = 'TextPdf';
  String? text;
  ts.TextStyle? style; // TODO: Write converter for ts.TextStyle <> ui.TextStyle
  String? textAlign;
  String? textDirection;
  bool? softWrap;
  bool? tightBounds = false;
  double? textScaleFactor = 1.0;
  int? maxLines;
  String? overflow;

  TextPdf(
      {this.text,
      this.style,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.tightBounds,
      this.textScaleFactor,
      this.maxLines,
      this.overflow});

  factory TextPdf.fromJson(Map<String, dynamic> json) =>
      _$TextPdfFromJson(json);

  Map<String, dynamic> toJson() => _$TextPdfToJson(this);

  @override
  Widget? buildWidget() {
    var value = Text(
      text ?? '',
      //style: style,
      textAlign: textAlign != null ? textAlign!.toAlign() : null,
      textDirection: textDirection != null ? textDirection!.toTextDirection() : TextDirection.ltr,
      softWrap: softWrap,
      tightBounds: tightBounds ?? false,
      textScaleFactor: textScaleFactor ?? 1,
      maxLines: maxLines ?? 1,
      overflow: overflow != null ? overflow!.toTextOverflow() : TextOverflow.clip,
    );

    return value;
  }
}
