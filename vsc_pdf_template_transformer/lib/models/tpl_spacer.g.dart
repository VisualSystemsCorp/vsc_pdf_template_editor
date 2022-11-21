// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_spacer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplSpacer _$TplSpacerFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplSpacer',
      json,
      ($checkedConvert) {
        final val = TplSpacer();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('flex', (v) => val.flex = v);
        return val;
      },
    );

Map<String, dynamic> _$TplSpacerToJson(TplSpacer instance) => <String, dynamic>{
      't': instance.t,
      'flex': instance.flex,
    };
