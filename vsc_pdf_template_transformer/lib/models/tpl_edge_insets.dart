import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;

part 'tpl_edge_insets.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplEdgeInsets {
  const TplEdgeInsets({
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.all = 0,
    this.vertical = 0,
    this.horizontal = 0,
    this.type = 'zero',
  });

  final double left;

  final double top;

  final double right;

  final double bottom;

  final double all;

  final double vertical;

  final double horizontal;

  final String type;

  factory TplEdgeInsets.fromJson(Map<String, dynamic> json) =>
      _$TplEdgeInsetsFromJson(json);

  Map<String, dynamic> toJson() => _$TplEdgeInsetsToJson(this);

  static TplEdgeInsets? from(ws.EdgeInsets value) {
    final result = TplEdgeInsets();
    return result;
  }

  static ws.EdgeInsets to(TplEdgeInsets? value) {
    if (value == null) return ws.EdgeInsets.zero;
    ws.EdgeInsets result = ws.EdgeInsets.zero;
    switch (value.type) {
      case 'fromLTRB':
        result = ws.EdgeInsets.fromLTRB(
          value.left,
          value.top,
          value.right,
          value.bottom,
        );
        break;
      case 'all':
        result = ws.EdgeInsets.all(value.all);
        break;
      case 'only':
        result = ws.EdgeInsets.only(
          left: value.left,
          top: value.top,
          right: value.right,
          bottom: value.bottom,
        );
        break;
      case 'symmetric':
        result = ws.EdgeInsets.symmetric(
          vertical: value.vertical,
          horizontal: value.horizontal,
        );
        break;
    }
    return result;
  }
}
