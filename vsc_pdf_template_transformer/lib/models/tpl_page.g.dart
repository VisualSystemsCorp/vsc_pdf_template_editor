// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPage _$TplPageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplPage',
      json,
      ($checkedConvert) {
        final val = TplPage(
          $checkedConvert(
              'child',
              (v) => const WidgetJsonConverter()
                  .fromJson(v as Map<String, dynamic>?)),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplPageToJson(TplPage instance) => <String, dynamic>{
      'className': instance.className,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
