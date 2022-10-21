import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_strings.dart';

class AddPropertyDialog extends StatefulWidget {
  const AddPropertyDialog({
    super.key,
    required this.supportedWidgets,
    required this.supportedProperties,
  });

  final List<String> supportedWidgets;
  final Map<String, dynamic> supportedProperties;

  @override
  State<StatefulWidget> createState() => _AddPropertyDialogState();
}

class _AddPropertyDialogState extends State<AddPropertyDialog> {
  int _selectedWidget = 0;
  int _selectedProperty = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      widget.supportedWidgets.length,
                      (i) => Container(
                            color: _selectedWidget == i
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            child: ListTile(
                              title: Text(widget.supportedWidgets[i]),
                              selected: _selectedWidget == i,
                              selectedColor: Colors.white,
                              onTap: () => _selectWidget(i),
                            ),
                          ))),
            ),
            Expanded(
                child: widget.supportedProperties[
                                widget.supportedWidgets[_selectedWidget]] !=
                            null &&
                        widget
                            .supportedProperties[
                                widget.supportedWidgets[_selectedWidget]]
                            .isNotEmpty
                    ? Column(
                        children: List.generate(
                            widget
                                .supportedProperties[
                                    widget.supportedWidgets[_selectedWidget]]
                                .length,
                            (i) => Container(
                                  color: _selectedProperty == i
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent,
                                  child: GestureDetector(
                                    onDoubleTap: () => Navigator.of(context)
                                        .pop(widget.supportedProperties[
                                            widget.supportedWidgets[
                                                _selectedWidget]][i]),
                                    onTap: () => _selectProperty(i),
                                    child: ListTile(
                                      title: Text(widget.supportedProperties[
                                          widget.supportedWidgets[
                                              _selectedWidget]][i]),
                                      selected: _selectedProperty == i,
                                      selectedColor: Colors.white,
                                    ),
                                  ),
                                )),
                      )
                    : const SizedBox())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(AppStrings.cancel)),
            TextButton(
                onPressed: () => Navigator.of(context).pop(_selectedWidget),
                child: const Text(AppStrings.ok))
          ],
        )
      ],
    );
  }

  void _selectWidget(int i) {
    setState(() {
      _selectedWidget = i;
    });
  }

  void _selectProperty(int i) {
    setState(() {
      _selectedProperty = i;
    });
  }
}
