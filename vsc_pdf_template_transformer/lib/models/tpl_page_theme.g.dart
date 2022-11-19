// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_page_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPageTheme _$TplPageThemeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPageTheme',
      json,
      ($checkedConvert) {
        final val = TplPageTheme();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('pageFormat', (v) => val.pageFormat = v);
        $checkedConvert('orientation', (v) => val.orientation = v);
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('clip', (v) => val.clip = v);
        $checkedConvert('textDirection', (v) => val.textDirection = v);
        $checkedConvert('theme', (v) => val.theme = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPageThemeToJson(TplPageTheme instance) =>
    <String, dynamic>{
      'className': instance.className,
      'pageFormat': instance.pageFormat,
      'orientation': instance.orientation,
      'margin': instance.margin?.toJson(),
      'clip': instance.clip,
      'textDirection': instance.textDirection,
      'theme': instance.theme,
    };
