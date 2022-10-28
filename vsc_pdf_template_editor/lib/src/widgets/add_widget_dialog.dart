import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class AddWidgetDialog extends StatefulWidget {
  const AddWidgetDialog({super.key, required this.items});

  final List<String> items;

  @override
  State<StatefulWidget> createState() => _AddWidgetDialogState();
}

class _AddWidgetDialogState extends State<AddWidgetDialog> {
  final TextEditingController controller = TextEditingController();
  int? _selected;
  List<String> searchedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: TextField(
            autofocus: true,
            controller: controller,
            decoration:
                const InputDecoration.collapsed(hintText: AppStrings.search),
            onChanged: (v) => _searchItems(),
          ),
        ),
        Flexible(
          child: ListView.builder(
              itemCount: controller.text.isEmpty
                  ? widget.items.length
                  : searchedItems.length,
              itemBuilder: (c, i) {
                final item = controller.text.isEmpty
                    ? widget.items[i]
                    : searchedItems[i];
                return Container(
                  color: _selected == i
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  child: GestureDetector(
                    onTap: () => _select(i),
                    onDoubleTap: () => Navigator.of(context).pop(item),
                    child: ListTile(
                      title: Text(item),
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

  _searchItems() => setState(() {
        searchedItems = widget.items
            .where(
                (e) => e.toLowerCase().contains(controller.text.toLowerCase()))
            .toList();
      });
}
