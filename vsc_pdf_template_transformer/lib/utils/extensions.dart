import 'package:pdf/widgets.dart';

/**
 * Extenssioons om String userd to convert String data comming from JSON to pdf widgets props
 */
extension AlignExtensions on String {
  toAlign() {
    if (this.contains("left")) {
      return TextAlign.left;
    } else if (this.contains("center")) {
      return TextAlign.center;
    } else if (this.contains("right")) {
      return TextAlign.right;
    } else if (this.contains("justify")) {
      return TextAlign.justify;
    }
  }
}

extension TextDirectionExtensions on String {
  toTextDirection() {
    if (this.contains("ltr")) {
      return TextDirection.ltr;
    } else if (this.contains("rtl")) {
      return TextDirection.rtl;
    }
  }
}

extension TextOverflowExtensions on String {
  toTextOverflow() {
    if (this.contains("clip")) {
      return TextOverflow.clip;
    } else if (this.contains("visible")) {
      return TextOverflow.visible ;
    } else if (this.contains("span")) {
      return TextOverflow.span ;
    }
  }
}