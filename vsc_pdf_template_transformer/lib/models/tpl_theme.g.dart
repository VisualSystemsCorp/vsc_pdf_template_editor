// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplThemeData _$TplThemeDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplThemeData',
      json,
      ($checkedConvert) {
        final val = TplThemeData();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'defaultTextStyle',
            (v) => val.defaultTextStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'paragraphStyle',
            (v) => val.paragraphStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'header0',
            (v) => val.header0 = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'header1',
            (v) => val.header1 = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'header2',
            (v) => val.header2 = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'header3',
            (v) => val.header3 = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'header4',
            (v) => val.header4 = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'header5',
            (v) => val.header5 = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'bulletStyle',
            (v) => val.bulletStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'tableHeader',
            (v) => val.tableHeader = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'tableCell',
            (v) => val.tableCell = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        $checkedConvert('softWrap', (v) => val.softWrap = v ?? true);
        $checkedConvert('textAlign', (v) => val.textAlign = v);
        $checkedConvert('maxLines', (v) => val.maxLines = v ?? 1);
        $checkedConvert('overflow', (v) => val.overflow = v);
        $checkedConvert(
            'iconTheme',
            (v) => val.iconTheme = v == null
                ? null
                : TplIconThemeData.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplThemeDataToJson(TplThemeData instance) =>
    <String, dynamic>{
      'className': instance.className,
      'defaultTextStyle': instance.defaultTextStyle?.toJson(),
      'paragraphStyle': instance.paragraphStyle?.toJson(),
      'header0': instance.header0?.toJson(),
      'header1': instance.header1?.toJson(),
      'header2': instance.header2?.toJson(),
      'header3': instance.header3?.toJson(),
      'header4': instance.header4?.toJson(),
      'header5': instance.header5?.toJson(),
      'bulletStyle': instance.bulletStyle?.toJson(),
      'tableHeader': instance.tableHeader?.toJson(),
      'tableCell': instance.tableCell?.toJson(),
      'softWrap': instance.softWrap,
      'textAlign': instance.textAlign,
      'maxLines': instance.maxLines,
      'overflow': instance.overflow,
      'iconTheme': instance.iconTheme?.toJson(),
    };
