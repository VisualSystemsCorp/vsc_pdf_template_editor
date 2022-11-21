// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_padding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPadding _$TplPaddingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplPadding',
      json,
      ($checkedConvert) {
        final val = TplPadding();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplPaddingToJson(TplPadding instance) =>
    <String, dynamic>{
      't': instance.t,
      'padding': instance.padding?.toJson(),
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
