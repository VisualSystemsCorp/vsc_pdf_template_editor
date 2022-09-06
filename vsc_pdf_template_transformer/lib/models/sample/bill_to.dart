import 'package:json_annotation/json_annotation.dart';

import 'phone_numbers.dart';

part 'bill_to.g.dart';

@JsonSerializable()
class BillTo {
  String? firstName;
  String? lastName;
  String? streetAddress1;
  String? streetAddress2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  List<PhoneNumbers>? phoneNumbers;

  BillTo(
      {this.firstName,
        this.lastName,
        this.streetAddress1,
        this.streetAddress2,
        this.city,
        this.state,
        this.postalCode,
        this.country,
        this.phoneNumbers});

  factory BillTo.fromJson(Map<String, dynamic> json) => _$BillToFromJson(json);


  Map<String, dynamic> toJson() =>  _$BillToToJson(this);

}