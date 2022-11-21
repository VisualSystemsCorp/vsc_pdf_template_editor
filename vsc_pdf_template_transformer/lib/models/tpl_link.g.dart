// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplLink _$TplLinkFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplLink',
      json,
      ($checkedConvert) {
        final val = TplLink();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('destination', (v) => val.destination = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplLinkToJson(TplLink instance) => <String, dynamic>{
      't': instance.t,
      'destination': instance.destination,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
