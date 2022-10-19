// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_alignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAlignment _$TplAlignmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAlignment',
      json,
      ($checkedConvert) {
        final val = TplAlignment(
          alignment:
              $checkedConvert('alignment', (v) => v as String? ?? 'center'),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplAlignmentToJson(TplAlignment instance) =>
    <String, dynamic>{
      'alignment': instance.alignment,
    };
