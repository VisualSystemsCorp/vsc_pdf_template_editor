import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class AddWidgetDialog extends StatefulWidget {
  const AddWidgetDialog({super.key, required this.supportedWidgets});

  final List<String> supportedWidgets;

  @override
  State<StatefulWidget> createState() => _AddWidgetDialogState();
}

class _AddWidgetDialogState extends State<AddWidgetDialog> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                widget.supportedWidgets.length,
                (i) => Container(
                      color: _selected == i
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      child: ListTile(
                        title: Text(widget.supportedWidgets[i]),
                        selected: _selected == i,
                        selectedColor: Colors.white,
                        onTap: () => _select(i),
                      ),
                    ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(AppStrings.cancel)),
            TextButton(
                onPressed: () => Navigator.of(context).pop(_selected),
                child: const Text(AppStrings.ok))
          ],
        )
      ],
    );
  }

  void _select(int i) {
    setState(() {
      _selected = i;
    });
  }
}
