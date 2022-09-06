import 'package:json_annotation/json_annotation.dart';

part 'phone_numbers.g.dart';

@JsonSerializable()
class PhoneNumbers {
  String? phone;
  String? type;

  PhoneNumbers({this.phone, this.type});

  factory PhoneNumbers.fromJson(Map<String, dynamic> json) => _$PhoneNumbersFromJson(json);


  Map<String, dynamic> toJson() => _$PhoneNumbersToJson(this);

}