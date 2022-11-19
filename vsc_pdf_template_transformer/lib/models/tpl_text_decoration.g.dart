// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_text_decoration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTextDecoration _$TplTextDecorationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplTextDecoration',
      json,
      ($checkedConvert) {
        final val = TplTextDecoration(
          decoration: $checkedConvert('decoration', (v) => v ?? 'none'),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplTextDecorationToJson(TplTextDecoration instance) =>
    <String, dynamic>{
      'decoration': instance.decoration,
    };
