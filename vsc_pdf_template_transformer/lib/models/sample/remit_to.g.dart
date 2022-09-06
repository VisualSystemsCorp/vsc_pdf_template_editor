// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remit_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemitTo _$RemitToFromJson(Map<String, dynamic> json) => RemitTo(
      companyName: json['companyName'] as String?,
      streetAddress1: json['streetAddress1'] as String?,
      streetAddress2: json['streetAddress2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      email: json['email'] as String?,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
          ?.map((e) => PhoneNumbers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemitToToJson(RemitTo instance) => <String, dynamic>{
      'companyName': instance.companyName,
      'streetAddress1': instance.streetAddress1,
      'streetAddress2': instance.streetAddress2,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'email': instance.email,
      'phoneNumbers': instance.phoneNumbers,
    };
