import 'package:flutter/material.dart';

class WidgetPalette extends StatelessWidget {
  final List<String> supportedWidgets;
  final Function(String widgetType, Offset position) onWidgetDragged;

  const WidgetPalette({
    Key? key,
    required this.supportedWidgets,
    required this.onWidgetDragged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Widget Palette',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: supportedWidgets.length,
              itemBuilder: (context, index) {
                final widgetType = supportedWidgets[index];
                return DraggableWidgetItem(
                  widgetType: widgetType,
                  onWidgetDragged: onWidgetDragged,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DraggableWidgetItem extends StatelessWidget {
  final String widgetType;
  final Function(String widgetType, Offset position) onWidgetDragged;

  const DraggableWidgetItem({
    Key? key,
    required this.widgetType,
    required this.onWidgetDragged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: widgetType,
      feedback: Material(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.blue[100],
          child: Text(widgetType),
        ),
      ),
      childWhenDragging: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.grey[300],
        child: Text(widgetType),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: ListTile(
          title: Text(widgetType),
          leading: const Icon(Icons.drag_indicator),
        ),
      ),
      onDragEnd: (details) {
        if (details.wasAccepted) {
          onWidgetDragged(widgetType, details.offset);
        }
      },
    );
  }
}