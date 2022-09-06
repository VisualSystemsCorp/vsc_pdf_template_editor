import 'package:json_annotation/json_annotation.dart';

import 'phone_numbers.dart';

part 'contact.g.dart';

@JsonSerializable()

class Contact {
  String? firstName;
  String? lastName;
  String? streetAddress1;
  String? streetAddress2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  List<String>? tags;
  List<PhoneNumbers>? phoneNumbers;

  Contact(
      {this.firstName,
        this.lastName,
        this.streetAddress1,
        this.streetAddress2,
        this.city,
        this.state,
        this.postalCode,
        this.country,
        this.tags,
        this.phoneNumbers});

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

}
