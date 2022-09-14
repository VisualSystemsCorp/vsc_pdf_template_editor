import 'package:flutter/material.dart';

class EditParamWidget extends StatelessWidget {
  const EditParamWidget({Key? key}) : super(key: key);

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
                children: const [
                  Text('Widget Properties', style: TextStyle(fontWeight: FontWeight.bold ),),
                ],),
            ),
          ),
        );
      },
    );
  }
}
