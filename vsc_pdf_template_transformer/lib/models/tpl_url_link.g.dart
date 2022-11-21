// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_url_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplUrlLink _$TplUrlLinkFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplUrlLink',
      json,
      ($checkedConvert) {
        final val = TplUrlLink();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('destination', (v) => val.destination = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplUrlLinkToJson(TplUrlLink instance) =>
    <String, dynamic>{
      't': instance.t,
      'destination': instance.destination,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
