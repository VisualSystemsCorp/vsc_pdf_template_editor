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
        $checkedConvert(
            'pageTheme',
            (v) => val.pageTheme = v == null
                ? null
                : TplPageTheme.fromJson(v as Map<String, dynamic>));
        $checkedConvert('theme', (v) => val.theme = v);
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
        return val;
      },
    );

Map<String, dynamic> _$TplPageToJson(TplPage instance) => <String, dynamic>{
      'className': instance.className,
      'pageTheme': instance.pageTheme?.toJson(),
      'theme': instance.theme,
      'pageFormat': instance.pageFormat?.toJson(),
      'orientation': instance.orientation,
      'margin': instance.margin?.toJson(),
      'clip': instance.clip,
      'textDirection': instance.textDirection,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
