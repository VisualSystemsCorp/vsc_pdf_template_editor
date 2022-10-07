import 'package:json_annotation/json_annotation.dart';

part 'tpl_string.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
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
}
