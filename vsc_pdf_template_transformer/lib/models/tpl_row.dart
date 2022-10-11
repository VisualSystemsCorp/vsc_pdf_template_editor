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
  String className = 'TplRow';
  @JsonKey()
  String id;
  @JsonKey(defaultValue: MainAxisAlignment.start)
  MainAxisAlignment mainAxisAlignment;
  @JsonKey(defaultValue: MainAxisSize.max)
  MainAxisSize mainAxisSize;
  @JsonKey(defaultValue: CrossAxisAlignment.center)
  CrossAxisAlignment crossAxisAlignment;
  @JsonKey(defaultValue: VerticalDirection.down)
  VerticalDirection verticalDirection;
  @WidgetJsonConverter()
  List<wb.WidgetBuilder?>? children;

  TplRow({
    required this.id,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.children,
  });

  factory TplRow.fromJson(Map<String, dynamic> json) => _$TplRowFromJson(json);

  Map<String, dynamic> toJson() => _$TplRowToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    final value = Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        verticalDirection: verticalDirection,
        children: children != null && children!.isNotEmpty
            ? List.generate(children!.length,
                (index) => children![index]!.buildWidget(data)!)
            : []);
    return value;
  }
}
