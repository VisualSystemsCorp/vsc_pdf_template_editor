// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_sized_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplSizedBox _$TplSizedBoxFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplSizedBox',
      json,
      ($checkedConvert) {
        final val = TplSizedBox(
          width: $checkedConvert('width', (v) => (v as num?)?.toDouble() ?? 0),
          height:
              $checkedConvert('height', (v) => (v as num?)?.toDouble() ?? 0),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplSizedBoxToJson(TplSizedBox instance) =>
    <String, dynamic>{
      'className': instance.className,
      'width': instance.width,
      'height': instance.height,
    };
