// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_barcode_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBarcodeWidget _$TplBarcodeWidgetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBarcodeWidget',
      json,
      ($checkedConvert) {
        final val = TplBarcodeWidget();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('data', (v) => val.data = v);
        $checkedConvert('type', (v) => val.type = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('backgroundColor', (v) => val.backgroundColor = v);
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('height', (v) => val.height = v);
        $checkedConvert('drawText', (v) => val.drawText = v);
        $checkedConvert(
            'textStyle',
            (v) => val.textStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert('textPadding', (v) => val.textPadding = v);
        return val;
      },
    );

Map<String, dynamic> _$TplBarcodeWidgetToJson(TplBarcodeWidget instance) =>
    <String, dynamic>{
      't': instance.t,
      'data': instance.data,
      'type': instance.type,
      'color': instance.color,
      'backgroundColor': instance.backgroundColor,
      'decoration': instance.decoration?.toJson(),
      'margin': instance.margin?.toJson(),
      'padding': instance.padding?.toJson(),
      'width': instance.width,
      'height': instance.height,
      'drawText': instance.drawText,
      'textStyle': instance.textStyle?.toJson(),
      'textPadding': instance.textPadding,
    };
