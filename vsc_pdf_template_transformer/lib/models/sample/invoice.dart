import 'package:json_annotation/json_annotation.dart';

import 'bill_to.dart';
import 'line_items.dart';
import 'remit_to.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  String? heading;
  String? invoiceSummary;
  String? invoiceDate;
  String? invoiceNumber;
  String? dueDate;
  String? taxRate;
  String? notes;
  double? totalPrice;
  double? taxAmount;
  int? totalCreditsApplied;
  int? totalPaymentsApplied;
  BillTo? billTo;
  RemitTo? remitTo;
  List<LineItems>? lineItems;

  Invoice(
      {this.heading,
        this.invoiceSummary,
        this.invoiceDate,
        this.invoiceNumber,
        this.dueDate,
        this.taxRate,
        this.notes,
        this.totalPrice,
        this.taxAmount,
        this.totalCreditsApplied,
        this.totalPaymentsApplied,
        this.billTo,
        this.remitTo,
        this.lineItems});

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);


  Map<String, dynamic> toJson() => _$InvoiceToJson(this);

}








