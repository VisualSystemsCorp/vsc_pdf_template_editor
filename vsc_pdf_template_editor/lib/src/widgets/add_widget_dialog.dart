import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class AddWidgetDialog extends StatefulWidget {
  const AddWidgetDialog({super.key, required this.items});

  final List<String> items;

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
        Flexible(
          child: ListView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              itemBuilder: (c, i) {
                return Container(
                  color: _selected == i
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  child: GestureDetector(
                    onTap: () => _select(i),
                    onDoubleTap: () => Navigator.of(context).pop(i),
                    child: ListTile(
                      title: Text(widget.items[i]),
                      selected: _selected == i,
                      selectedColor: Colors.white,
                    ),
                  ),
                );
              }),
        ),
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
