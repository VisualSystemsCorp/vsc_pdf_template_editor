import 'package:json_annotation/json_annotation.dart';

import 'phone_numbers.dart';

part 'remit_to.g.dart';

@JsonSerializable()
class RemitTo {
  String? companyName;
  String? streetAddress1;
  String? streetAddress2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? email;
  List<PhoneNumbers>? phoneNumbers;

  RemitTo(
      {this.companyName,
        this.streetAddress1,
        this.streetAddress2,
        this.city,
        this.state,
        this.postalCode,
        this.country,
        this.email,
        this.phoneNumbers});

  factory RemitTo.fromJson(Map<String, dynamic> json) =>  _$RemitToFromJson(json);


  Map<String, dynamic> toJson() => _$RemitToToJson(this);

}