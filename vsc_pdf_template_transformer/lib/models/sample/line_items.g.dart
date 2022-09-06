// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineItems _$LineItemsFromJson(Map<String, dynamic> json) => LineItems(
      itemDescription: json['itemDescription'] as String?,
      trade: json['trade'] as String?,
      quantity: json['quantity'] as int?,
      uomCode: json['uomCode'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      extendedPrice: (json['extendedPrice'] as num?)?.toDouble(),
      taxable: json['taxable'] as bool?,
    );

Map<String, dynamic> _$LineItemsToJson(LineItems instance) => <String, dynamic>{
      'itemDescription': instance.itemDescription,
      'trade': instance.trade,
      'quantity': instance.quantity,
      'uomCode': instance.uomCode,
      'unitPrice': instance.unitPrice,
      'extendedPrice': instance.extendedPrice,
      'taxable': instance.taxable,
    };
