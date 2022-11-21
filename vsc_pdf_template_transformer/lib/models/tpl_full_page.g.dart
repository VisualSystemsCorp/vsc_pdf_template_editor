// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_full_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFullPage _$TplFullPageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplFullPage',
      json,
      ($checkedConvert) {
        final val = TplFullPage();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('ignoreMargins', (v) => val.ignoreMargins = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplFullPageToJson(TplFullPage instance) =>
    <String, dynamic>{
      't': instance.t,
      'ignoreMargins': instance.ignoreMargins,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
