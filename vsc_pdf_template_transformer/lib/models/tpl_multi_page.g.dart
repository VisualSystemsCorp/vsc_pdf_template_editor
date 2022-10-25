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
        $checkedConvert(
            'pageTheme',
            (v) => val.pageTheme = v == null
                ? null
                : TplPageTheme.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'theme',
            (v) => val.theme = v == null
                ? null
                : TplThemeData.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'pageFormat',
            (v) => val.pageFormat = v == null
                ? null
                : TplPdfPageFormat.fromJson(v as Map<String, dynamic>));
        $checkedConvert('orientation', (v) => val.orientation = v);
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('clip', (v) => val.clip = v);
        $checkedConvert('textDirection', (v) => val.textDirection = v);
        $checkedConvert('maxPages', (v) => val.maxPages = v);
        $checkedConvert('mainAxisAlignment', (v) => val.mainAxisAlignment = v);
        $checkedConvert(
            'crossAxisAlignment', (v) => val.crossAxisAlignment = v);
        return val;
      },
    );

Map<String, dynamic> _$TplMultiPageToJson(TplMultiPage instance) =>
    <String, dynamic>{
      'className': instance.className,
      'pageTheme': instance.pageTheme?.toJson(),
      'theme': instance.theme?.toJson(),
      'pageFormat': instance.pageFormat?.toJson(),
      'orientation': instance.orientation,
      'margin': instance.margin?.toJson(),
      'clip': instance.clip,
      'textDirection': instance.textDirection,
      'maxPages': instance.maxPages,
      'mainAxisAlignment': instance.mainAxisAlignment,
      'crossAxisAlignment': instance.crossAxisAlignment,
      'children':
          instance.children?.map(const WidgetJsonConverter().toJson).toList(),
    };
