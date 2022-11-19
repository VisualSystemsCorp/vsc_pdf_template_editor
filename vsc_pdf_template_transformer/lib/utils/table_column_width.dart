import 'package:pdf/widgets.dart' as tcw;

abstract class TableColumnWidth {
  Future<tcw.TableColumnWidth> buildTableColumnWidth(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
