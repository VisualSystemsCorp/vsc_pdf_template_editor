import 'package:json_annotation/json_annotation.dart';


part 'text_style.g.dart';

@JsonSerializable()
class TextStyle {
  String? color;
  String? backgroundColor;
  double? fontSize;
  String? fontWeight;
  String? fontStyle;
  double? letterSpacing;
  double? wordSpacing;
  String? textBaseline;
  double? height;
  String? leadingDistribution;
  String? locale;
  String? foreground;
  String? background;
  String? fontFamily;
  String? package;
  String? overflow;

  TextStyle({
   this.color,
   this.backgroundColor,
   this.fontSize,
   this.fontWeight,
   this.fontStyle,
   this.letterSpacing,
   this.wordSpacing,
   this.textBaseline,
   this.height,
   this.leadingDistribution,
   this.locale,
   this.foreground,
   this.background,
   this.fontFamily,
   this.package,
   this.overflow});

  factory TextStyle.fromJson( Map<String, dynamic> json) => _$TextStyleFromJson(json);
  Map<String, dynamic> toJson() => _$TextStyleToJson(this);

}