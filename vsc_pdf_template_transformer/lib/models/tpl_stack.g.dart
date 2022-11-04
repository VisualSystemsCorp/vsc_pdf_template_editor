// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplStack _$TplStackFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplStack',
      json,
      ($checkedConvert) {
        final val = TplStack();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'alignment',
            (v) => val.alignment = const AlignmentJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert('overflow', (v) => val.overflow = v);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplStackToJson(TplStack instance) => <String, dynamic>{
      'className': instance.className,
      'alignment': const AlignmentJsonConverter().toJson(instance.alignment),
      'fit': instance.fit,
      'overflow': instance.overflow,
      'children': instance.children,
    };
