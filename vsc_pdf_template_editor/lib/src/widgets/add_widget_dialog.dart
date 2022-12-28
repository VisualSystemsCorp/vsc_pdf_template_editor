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
  String? _selectedName;
  List<String> searchedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: TextField(
            autofocus: true,
            controller: controller,
            decoration: const InputDecoration(hintText: AppStrings.search),
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
                    onTap: () => _select(i, item),
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
                onPressed: () => Navigator.of(context).pop(_selectedName),
                child: const Text(AppStrings.ok))
          ],
        )
      ],
    );
  }

  void _select(int i, String name) {
    setState(() {
      _selected = i;
      _selectedName = name;
    });
  }

  _searchItems() => setState(() {
        searchedItems = widget.items
            .where(
                (e) => e.toLowerCase().contains(controller.text.toLowerCase()))
            .toList();
      });
}
