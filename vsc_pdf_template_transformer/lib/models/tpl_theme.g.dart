// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTheme _$TplThemeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplTheme',
      json,
      ($checkedConvert) {
        final val = TplTheme();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('data', (v) => val.data = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        return val;
      },
    );

Map<String, dynamic> _$TplThemeToJson(TplTheme instance) => <String, dynamic>{
      'className': instance.className,
      'data': instance.data,
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
