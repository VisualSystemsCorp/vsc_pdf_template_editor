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
  String className = 'TplColumn';
  @JsonKey()
  String id;
  @WidgetJsonConverter()
  List<wb.WidgetBuilder?>? children;

  TplColumn({
    required this.id,
    this.children,
  });

  factory TplColumn.fromJson(Map<String, dynamic> json) =>
      _$TplColumnFromJson(json);

  Map<String, dynamic> toJson() => _$TplColumnToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    var value = Column(
        children: children != null && children!.isNotEmpty
            ? List.generate(children!.length,
                (index) => children![index]!.buildWidget(data)!)
            : []);
    return value;
  }
}
