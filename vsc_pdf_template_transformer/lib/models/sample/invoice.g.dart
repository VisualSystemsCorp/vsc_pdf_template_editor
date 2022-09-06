// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      heading: json['heading'] as String?,
      invoiceSummary: json['invoiceSummary'] as String?,
      invoiceDate: json['invoiceDate'] as String?,
      invoiceNumber: json['invoiceNumber'] as String?,
      dueDate: json['dueDate'] as String?,
      taxRate: json['taxRate'] as String?,
      notes: json['notes'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      totalCreditsApplied: json['totalCreditsApplied'] as int?,
      totalPaymentsApplied: json['totalPaymentsApplied'] as int?,
      billTo: json['billTo'] == null
          ? null
          : BillTo.fromJson(json['billTo'] as Map<String, dynamic>),
      remitTo: json['remitTo'] == null
          ? null
          : RemitTo.fromJson(json['remitTo'] as Map<String, dynamic>),
      lineItems: (json['lineItems'] as List<dynamic>?)
          ?.map((e) => LineItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'heading': instance.heading,
      'invoiceSummary': instance.invoiceSummary,
      'invoiceDate': instance.invoiceDate,
      'invoiceNumber': instance.invoiceNumber,
      'dueDate': instance.dueDate,
      'taxRate': instance.taxRate,
      'notes': instance.notes,
      'totalPrice': instance.totalPrice,
      'taxAmount': instance.taxAmount,
      'totalCreditsApplied': instance.totalCreditsApplied,
      'totalPaymentsApplied': instance.totalPaymentsApplied,
      'billTo': instance.billTo,
      'remitTo': instance.remitTo,
      'lineItems': instance.lineItems,
    };
