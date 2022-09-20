import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/tree_store.dart';

class EditParamWidget extends StatefulWidget {
  const EditParamWidget({Key? key}) : super(key: key);

  @override
  State<EditParamWidget> createState() => _EditParamWidgetState();
}

class _EditParamWidgetState extends State<EditParamWidget> {
  final treeStore = TreeStore();
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    _initControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraint) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: SizedBox(
            width: width * 0.25,
            height: height - 50, //TODO add smart resolving
            child: Observer(builder: (context) {
              return treeStore.widgetProps.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Column(
                        children: [
                          const Text(
                            'Widget Properties',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          _Items(
                            treeStore.widgetProps.keys.toList(),
                            _controllers,
                          )
                        ],
                      ),
                    );
            }),
          ),
        );
      },
    );
  }

  _initControllers() {
    treeStore.widgetProps
        .forEach((key, value) => _controllers.add(TextEditingController()));
  }
}

class _Items extends StatelessWidget {
  const _Items(
    this._keys,
    this._controllers,
  );

  final List<String> _keys;
  final List<TextEditingController> _controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            _keys.length,
            (index) => Padding(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _keys[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none, isDense: true),
                              controller: _controllers[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ]),
                    ),
                  ),
                )) //_widgetsProps(treeStore.widgetProps),
        );
  }
}
