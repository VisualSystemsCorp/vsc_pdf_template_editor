// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_constrained_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplConstrainedBox _$TplConstrainedBoxFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplConstrainedBox',
      json,
      ($checkedConvert) {
        final val = TplConstrainedBox();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'constraints',
            (v) => val.constraints = v == null
                ? null
                : TplBoxConstraints.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplConstrainedBoxToJson(TplConstrainedBox instance) =>
    <String, dynamic>{
      't': instance.t,
      'constraints': instance.constraints?.toJson(),
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
