import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_container.g.dart';

@JsonSerializable(
  checked: true,
  // Extra type checking
  disallowUnrecognizedKeys: false,
  // Allow unrecognized keys (e.g., "className") in JSON
  explicitToJson:
      true, // Allows deserialization of nested JSON objects.  (e.g., TplTextStyle)
)
class TplContainer implements wb.WidgetBuilder {
  String className = 'TplContainer';
  @JsonKey()
  double? width;
  @JsonKey()
  double? height;

  TplContainer({
    this.width,
    this.height,
  });

  factory TplContainer.fromJson(Map<String, dynamic> json) =>
      _$TplContainerFromJson(json);

  Map<String, dynamic> toJson() => _$TplContainerToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    var value = Container(
      width: width,
      height: height,
    );
    return value;
  }
}
