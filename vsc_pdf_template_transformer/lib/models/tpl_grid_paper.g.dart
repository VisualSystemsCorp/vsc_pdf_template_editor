// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_grid_paper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplGridPaper _$TplGridPaperFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplGridPaper',
      json,
      ($checkedConvert) {
        final val = TplGridPaper();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert('type', (v) => val.type = v);
        return val;
      },
    );

Map<String, dynamic> _$TplGridPaperToJson(TplGridPaper instance) =>
    <String, dynamic>{
      'className': instance.className,
      'color': instance.color,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'margin': instance.margin?.toJson(),
      'type': instance.type,
    };
