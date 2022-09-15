import 'package:flutter/material.dart';

import '../api_service.dart';

class EditParamWidget extends StatefulWidget {
  const EditParamWidget({Key? key}) : super(key: key);

  @override
  State<EditParamWidget> createState() => _EditParamWidgetState();
}

class _EditParamWidgetState extends State<EditParamWidget> {
  final _service = ApiService();
  Map<String, dynamic> widgetProps = <String, dynamic>{};

  @override
  void initState() {
    _service.getDataWidget().then((value) => widgetProps = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraint) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: SizedBox(
            width: _width * 0.25,
            height: _height - 50, //TODO add smart resolving
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _widgetsParam(widgetProps),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _widgetsParam(Map<String, dynamic> elements) {
    List<Widget> result = [];
    result.add(
      const Text(
        'Widget Properties',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    elements.forEach((key, value) {
      final _propsTextController = TextEditingController();
      if (!key.contains('className')) {
        _propsTextController.text = value.toString();
        final _propsWidget = Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 50,
            //width: 160,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.purple.shade500,
                ))),
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Text(
                  key.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
                TextField(
                   decoration: const InputDecoration( border: InputBorder.none, isDense: true),
                    controller: _propsTextController,
                    style: const TextStyle(fontSize: 12),
                ),
              ]),
            ),
          ),
        );

        result.add(_propsWidget);
      }
    });

    return result;
  }
}
