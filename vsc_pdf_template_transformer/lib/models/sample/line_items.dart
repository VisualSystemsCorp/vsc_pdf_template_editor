import 'package:json_annotation/json_annotation.dart';

part 'line_items.g.dart';

@JsonSerializable()
class LineItems {
  String? itemDescription;
  String? trade;
  int? quantity;
  String? uomCode;
  double? unitPrice;
  double? extendedPrice;
  bool? taxable;

  LineItems(
      {this.itemDescription,
        this.trade,
        this.quantity,
        this.uomCode,
        this.unitPrice,
        this.extendedPrice,
        this.taxable});

  factory LineItems.fromJson(Map<String, dynamic> json) => _$LineItemsFromJson(json);


  Map<String, dynamic> toJson() => _$LineItemsToJson(this);

}