import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';

part 'tpl_fitted_sizes.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFittedSizes {
  TplFittedSizes();

  TplPdfPoint? source;
  TplPdfPoint? destination;

  factory TplFittedSizes.fromJson(Map<String, dynamic> json) =>
      _$TplFittedSizesFromJson(json);

  Map<String, dynamic> toJson() => _$TplFittedSizesToJson(this);

  FittedSizes toPdf(Map<String, dynamic> data) {
    return FittedSizes(source?.toPdf(data), destination?.toPdf(data));
  }
}
