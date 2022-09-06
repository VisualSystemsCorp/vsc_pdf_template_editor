// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillTo _$BillToFromJson(Map<String, dynamic> json) => BillTo(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      streetAddress1: json['streetAddress1'] as String?,
      streetAddress2: json['streetAddress2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
          ?.map((e) => PhoneNumbers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillToToJson(BillTo instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'streetAddress1': instance.streetAddress1,
      'streetAddress2': instance.streetAddress2,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'phoneNumbers': instance.phoneNumbers,
    };
