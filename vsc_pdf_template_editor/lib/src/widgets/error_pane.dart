import 'package:flutter/material.dart';

class ErrorPane extends StatelessWidget {
  const ErrorPane({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.white, child: Center(child: Text(errorText)));
  }
}
