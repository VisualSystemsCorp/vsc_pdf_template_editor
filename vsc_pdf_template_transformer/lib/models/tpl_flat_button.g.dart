// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_flat_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFlatButton _$TplFlatButtonFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFlatButton',
      json,
      ($checkedConvert) {
        final val = TplFlatButton();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('textColor', (v) => val.textColor = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('colorDown', (v) => val.colorDown = v);
        $checkedConvert('colorRollover', (v) => val.colorRollover = v);
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'flags',
            (v) => val.flags = (v as List<dynamic>?)
                    ?.map((e) => $enumDecode(_$PdfAnnotFlagsEnumMap, e))
                    .toSet() ??
                {});
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('name', (v) => val.name = v);
        return val;
      },
    );

Map<String, dynamic> _$TplFlatButtonToJson(TplFlatButton instance) =>
    <String, dynamic>{
      'className': instance.className,
      'textColor': instance.textColor,
      'color': instance.color,
      'colorDown': instance.colorDown,
      'colorRollover': instance.colorRollover,
      'padding': instance.padding?.toJson(),
      'decoration': instance.decoration?.toJson(),
      'flags': instance.flags?.map((e) => _$PdfAnnotFlagsEnumMap[e]!).toList(),
      'child': const WidgetJsonConverter().toJson(instance.child),
      'name': instance.name,
    };

const _$PdfAnnotFlagsEnumMap = {
  PdfAnnotFlags.invisible: 'invisible',
  PdfAnnotFlags.hidden: 'hidden',
  PdfAnnotFlags.print: 'print',
  PdfAnnotFlags.noZoom: 'noZoom',
  PdfAnnotFlags.noRotate: 'noRotate',
  PdfAnnotFlags.noView: 'noView',
  PdfAnnotFlags.readOnly: 'readOnly',
  PdfAnnotFlags.locked: 'locked',
  PdfAnnotFlags.toggleNoView: 'toggleNoView',
  PdfAnnotFlags.lockedContent: 'lockedContent',
};
