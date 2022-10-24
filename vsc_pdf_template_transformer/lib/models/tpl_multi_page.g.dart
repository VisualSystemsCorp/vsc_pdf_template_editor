// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_multi_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplMultiPage _$TplMultiPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplMultiPage',
      json,
      ($checkedConvert) {
        final val = TplMultiPage(
          $checkedConvert(
              'children',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => const WidgetJsonConverter()
                      .fromJson(e as Map<String, dynamic>?))
                  .toList()),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplMultiPageToJson(TplMultiPage instance) =>
    <String, dynamic>{
      'className': instance.className,
      'children':
          instance.children?.map(const WidgetJsonConverter().toJson).toList(),
    };
