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
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('flex', (v) => val.flex = v);
        return val;
      },
    );

Map<String, dynamic> _$TplSpacerToJson(TplSpacer instance) => <String, dynamic>{
      'className': instance.className,
      'flex': instance.flex,
    };
