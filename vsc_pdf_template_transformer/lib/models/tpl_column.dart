import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_column.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplColumn implements wb.WidgetBuilder {
  TplColumn();

  String className = 'TplColumn';

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

  factory TplColumn.fromJson(Map<String, dynamic> json) =>
      _$TplColumnFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplColumnToJson(this);

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
