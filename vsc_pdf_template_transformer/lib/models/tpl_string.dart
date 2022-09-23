import 'package:json_annotation/json_annotation.dart';

part 'tpl_string.g.dart';

@JsonSerializable(
  checked: true, // Extra type checking
  disallowUnrecognizedKeys:
      false, // Allow unrecognized keys (e.g., "className") in JSON
)
class TplString {
  TplString({
    this.value = '',
    this.expression,
  });

  String value;
  String? expression;

  factory TplString.fromJson(Map<String, dynamic> json) =>
      _$TplStringFromJson(json);

  Map<String, dynamic> toJson() => _$TplStringToJson(this);

  static TplString? from(TplString value) {
    TplString result = TplString();
    result.value = value.value;
    result.expression = value.expression;
    return result;
  }

  static TplString to(TplString? value) {
    TplString result = TplString();
    if (value == null) return result;
    return result;
  }
}
