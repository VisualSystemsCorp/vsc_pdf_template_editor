import 'package:json_annotation/json_annotation.dart';

import 'text_style.dart';


part 'text_pdf.g.dart';

@JsonSerializable()
class TextPdf {
      String? text;
      TextStyle? style;
      String? textAlign;
      String? textDirection;
      bool? softWrap;
      bool? tightBounds = false;
      double? textScaleFactor = 1.0;
      int? maxLines;
      String? overflow;

      TextPdf({
      this.text,
      this.style,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.tightBounds,
      this.textScaleFactor,
      this.maxLines,
      this.overflow });

      factory TextPdf.fromJson(Map<String, dynamic> json) => _$TextPdfFromJson(json);
      Map<String, dynamic> toJson() => _$TextPdfToJson(this);
}