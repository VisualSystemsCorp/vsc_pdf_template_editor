import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_font.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFont {
  const TplFont({this.font = 'helvetica'});

  final dynamic font;

  factory TplFont.fromJson(Map<String, dynamic> json) =>
      _$TplFontFromJson(json);

  Map<String, dynamic> toJson() => _$TplFontToJson(this);

  Font toPdf(Map<String, dynamic> data) {
    final fontStr = evaluateString(font, data);
    switch (fontStr) {
      case 'courier':
        return Font.courier();
      case 'courierBold':
        return Font.courierBold();
      case 'courierBoldOblique':
        return Font.courierBoldOblique();
      case 'courierOblique':
        return Font.courierOblique();
      case 'helvetica':
        return Font.helvetica();
      case 'helveticaBold':
        return Font.helveticaBold();
      case 'helveticaBoldOblique':
        return Font.helveticaBoldOblique();
      case 'helveticaOblique':
        return Font.helveticaOblique();
      case 'times':
        return Font.times();
      case 'timesBold':
        return Font.timesBold();
      case 'timesBoldItalic':
        return Font.timesBoldItalic();
      case 'timesItalic':
        return Font.timesItalic();
      case 'symbol':
        return Font.symbol();
      case 'zapfDingbats':
        return Font.zapfDingbats();
      default:
        return Font.helvetica();
    }
  }

  static List<Font> getFontList(
      List<TplFont>? list, Map<String, dynamic> data) {
    final List<Font> res = [];
    if (list != null && list.isNotEmpty) {
      for (final e in list) {
        res.add(e.toPdf(data));
      }
    }
    return res;
  }
}
