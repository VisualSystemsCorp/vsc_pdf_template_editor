import 'package:flutter_treeview/flutter_treeview.dart';

abstract class IApplicationService{
  Future<List<Node>> getListNode(List<Map<String, dynamic>> listNode);
}
class ApplicationService extends IApplicationService {

  @override
  Future<List<Node>> getListNode(List<Map<String, dynamic>> listNode) async {
    List<Node> result = [];

    return result;
  }
}