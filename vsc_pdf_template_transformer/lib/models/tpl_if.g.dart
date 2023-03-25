// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_if.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplIf _$TplIfFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplIf',
      json,
      ($checkedConvert) {
        final val = TplIf();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('expression', (v) => val.expression = v);
        $checkedConvert(
            'thenChild',
            (v) => val.thenChild = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'elseChild',
            (v) => val.elseChild = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplIfToJson(TplIf instance) => <String, dynamic>{
      't': instance.t,
      'expression': instance.expression,
      'thenChild': const WidgetJsonConverter().toJson(instance.thenChild),
      'elseChild': const WidgetJsonConverter().toJson(instance.elseChild),
    };
