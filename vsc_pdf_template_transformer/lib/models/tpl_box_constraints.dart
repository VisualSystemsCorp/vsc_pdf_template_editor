import 'package:json_annotation/json_annotation.dart';
import "package:pdf/widgets.dart" as ws;

part 'tpl_box_constraints.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBoxConstraints {
  const TplBoxConstraints({
    this.minWidth = 0.0,
    this.maxWidth = 100000000000.0,
    this.minHeight = 0.0,
    this.maxHeight = 10000000000.0,
  });

  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;

  factory TplBoxConstraints.fromJson(Map<String, dynamic> json) =>
      _$TplBoxConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxConstraintsToJson(this);

  static TplBoxConstraints? from(ws.BoxConstraints value) {
    final result = TplBoxConstraints();
    return result;
  }

  static ws.BoxConstraints to(TplBoxConstraints? value) {
    if (value == null) return ws.BoxConstraints();
    ws.BoxConstraints result = ws.BoxConstraints();
    return result;
  }
}
