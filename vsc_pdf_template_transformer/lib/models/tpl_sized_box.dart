import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_sized_box.g.dart';

@JsonSerializable(
  checked: true,
  // Extra type checking
  disallowUnrecognizedKeys: false,
  // Allow unrecognized keys (e.g., "className") in JSON
  explicitToJson:
      true, // Allows deserialization of nested JSON objects.  (e.g., TplTextStyle)
)
class TplSizedBox implements wb.WidgetBuilder {
  String className = 'TplSizedBox';
  @JsonKey(defaultValue: 0)
  double? width;
  @JsonKey(defaultValue: 0)
  double height;

  TplSizedBox({this.width = 0, this.height = 0});

  factory TplSizedBox.fromJson(Map<String, dynamic> json) =>
      _$TplSizedBoxFromJson(json);

  Map<String, dynamic> toJson() => _$TplSizedBoxToJson(this);

  @override
  Widget? buildWidget() {
    var value = SizedBox(
      width: width,
      height: height,
    );
    return value;
  }
}
