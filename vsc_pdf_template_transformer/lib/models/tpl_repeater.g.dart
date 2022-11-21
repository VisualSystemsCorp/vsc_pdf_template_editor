// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_repeater.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRepeater _$TplRepeaterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplRepeater',
      json,
      ($checkedConvert) {
        final val = TplRepeater();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('array', (v) => val.array = v);
        $checkedConvert(
            'childTemplate',
            (v) => val.childTemplate = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplRepeaterToJson(TplRepeater instance) =>
    <String, dynamic>{
      't': instance.t,
      'array': instance.array,
      'childTemplate':
          const WidgetJsonConverter().toJson(instance.childTemplate),
    };
