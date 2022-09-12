import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';

import '../utils/widget_builder.dart' as wb;
import '../utils/extensions.dart';
import 'text_style.dart';

part 'text_pdf.g.dart';

@JsonSerializable()
class TplText implements wb.WidgetBuilder {
  String className = 'TplText';
  String text;
  TplTextStyle? style;
  @JsonKey(defaultValue: "left")
  String textAlign;
  @JsonKey(defaultValue: "lrt")
  String textDirection;
  @JsonKey(defaultValue: true)
  bool softWrap;
  @JsonKey(defaultValue: false)
  bool tightBounds = false;
  @JsonKey(defaultValue: 1.0)
  double textScaleFactor = 1.0;
  @JsonKey(defaultValue: 1)
  int maxLines;
  @JsonKey(defaultValue: "clip")
  String overflow;

  TplText(
      {required this.text,
      this.style,
      required this.textAlign,
      required this.textDirection,
      required this.softWrap,
      required this.tightBounds,
      required this.textScaleFactor,
      required this.maxLines,
      required this.overflow});

  factory TplText.fromJson(Map<String, dynamic> json) =>
      _$TplTextFromJson(json);

  Map<String, dynamic> toJson() => _$TplTextToJson(this);

  @override
  Widget? buildWidget() {
    print('--- style: ${style} ------');
    var value = Text(
      text ?? '',
      style: TplTextStyle.to(style),
      textAlign: textAlign.toAlign(),
      textDirection: textDirection.toTextDirection(),
      softWrap: softWrap,
      tightBounds: tightBounds,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      overflow: overflow.toTextOverflow(),
    );

    print('--- value style: ${value.text.style!.color!.toHex()} ------');
    return value;
  }
}
