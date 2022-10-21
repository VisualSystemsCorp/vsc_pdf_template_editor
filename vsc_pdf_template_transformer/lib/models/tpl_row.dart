import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_row.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRow implements wb.WidgetBuilder {
  TplRow();

  String className = 'TplRow';

  @JsonKey(defaultValue: MainAxisAlignment.start)
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;

  @JsonKey(defaultValue: MainAxisSize.max)
  MainAxisSize mainAxisSize = MainAxisSize.max;

  @JsonKey(defaultValue: CrossAxisAlignment.center)
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

  @JsonKey(defaultValue: VerticalDirection.down)
  VerticalDirection verticalDirection = VerticalDirection.down;

  @WidgetJsonConverter()
  List<wb.WidgetBuilder?>? children;

  factory TplRow.fromJson(Map<String, dynamic> json) => _$TplRowFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRowToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      children: children == null
          ? []
          : children!
              .map((child) => child!.buildWidget(data))
              .toList(growable: false),
    );
  }
}
