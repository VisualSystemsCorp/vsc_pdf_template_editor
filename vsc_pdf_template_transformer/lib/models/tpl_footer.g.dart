// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_footer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFooter _$TplFooterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplFooter',
      json,
      ($checkedConvert) {
        final val = TplFooter();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'leading',
            (v) => val.leading = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'title',
            (v) => val.title = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'trailing',
            (v) => val.trailing = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert(
            'margin',
            (v) => val.margin = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'padding',
            (v) => val.padding = v == null
                ? null
                : TplEdgeInsets.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplFooterToJson(TplFooter instance) => <String, dynamic>{
      't': instance.t,
      'leading': const WidgetJsonConverter().toJson(instance.leading),
      'title': const WidgetJsonConverter().toJson(instance.title),
      'trailing': const WidgetJsonConverter().toJson(instance.trailing),
      'margin': instance.margin?.toJson(),
      'padding': instance.padding?.toJson(),
      'decoration': instance.decoration?.toJson(),
    };
