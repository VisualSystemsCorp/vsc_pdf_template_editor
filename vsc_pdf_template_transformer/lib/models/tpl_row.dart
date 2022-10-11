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
  @WidgetJsonConverter()
  List<wb.WidgetBuilder?>? children;

  TplRow({
    required this.id,
    this.children,
  });

  factory TplRow.fromJson(Map<String, dynamic> json) => _$TplRowFromJson(json);

  Map<String, dynamic> toJson() => _$TplRowToJson(this);

  @override
  Widget? buildWidget(Map<String, dynamic> data) {
    var value = Row(
        children: children != null && children!.isNotEmpty
            ? List.generate(children!.length,
                (index) => children![index]!.buildWidget(data)!)
            : []);
    return value;
  }
}
