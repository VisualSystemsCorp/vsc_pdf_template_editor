import 'package:flutter/material.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';

class DesignCanvas extends StatefulWidget {
  final Map<String, dynamic> documentStructure;
  final Function(Map<String, dynamic>) onWidgetSelected;
  final Map<String, dynamic>? selectedWidget;

  const DesignCanvas({
    Key? key,
    required this.documentStructure,
    required this.onWidgetSelected,
    this.selectedWidget,
  }) : super(key: key);

  @override
  State<DesignCanvas> createState() => _DesignCanvasState();
}

class _DesignCanvasState extends State<DesignCanvas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          // Paper-like background with page boundaries
          Center(
            child: Container(
              width: 595.0, // A4 width in points
              height: 842.0, // A4 height in points
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: _buildDesignWidgets(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDesignWidgets() {
    final List<Widget> widgets = [];
    
    // If document has children, render them
    if (widget.documentStructure.containsKey('children') && 
        widget.documentStructure['children'] is List) {
      
      final children = widget.documentStructure['children'] as List;
      
      for (var i = 0; i < children.length; i++) {
        final childWidget = children[i] as Map<String, dynamic>;
        widgets.add(
          DesignWidgetItem(
            key: ValueKey('widget-$i'),
            widgetData: childWidget,
            parentList: children,
            documentStructure: widget.documentStructure,
            isSelected: childWidget == widget.selectedWidget,
            onWidgetSelected: widget.onWidgetSelected,
            index: i,
          ),
        );
      }
    }
    
    return widgets;
  }
}

class DesignWidgetItem extends StatefulWidget {
  final Map<String, dynamic> widgetData;
  final List parentList;
  final Map<String, dynamic> documentStructure;
  final bool isSelected;
  final Function(Map<String, dynamic>) onWidgetSelected;
  final int index;

  const DesignWidgetItem({
    Key? key,
    required this.widgetData,
    required this.parentList,
    required this.documentStructure,
    required this.isSelected,
    required this.onWidgetSelected,
    required this.index,
  }) : super(key: key);

  @override
  State<DesignWidgetItem> createState() => _DesignWidgetItemState();
}

class _DesignWidgetItemState extends State<DesignWidgetItem> {
  Offset position = const Offset(50, 50);
  Size size = const Size(200, 100);
  
  // Whether this widget can accept children or not
  bool get isContainer {
    final widgetType = widget.widgetData['t'] as String;
    return ['Row', 'Column', 'Container', 'MultiPage', 'Page', 
            'Sized Box', 'Stack', 'Positioned'].contains(widgetType);
  }
  
  @override
  void initState() {
    super.initState();
    
    // Ensure all widgets have design properties
    if (!widget.widgetData.containsKey('designPosition')) {
      widget.widgetData['designPosition'] = {
        'x': 50.0,
        'y': 50.0,
      };
    }
    
    if (!widget.widgetData.containsKey('designSize')) {
      widget.widgetData['designSize'] = {
        'width': 200.0,
        'height': 100.0,
      };
    }
    
    // Initialize position from widget data
    final posData = widget.widgetData['designPosition'];
    position = Offset(
      posData['x'] is double ? posData['x'] : (posData['x'] as num).toDouble(),
      posData['y'] is double ? posData['y'] : (posData['y'] as num).toDouble(),
    );
    
    // Initialize size from widget data
    final sizeData = widget.widgetData['designSize'];
    size = Size(
      sizeData['width'] is double ? sizeData['width'] : (sizeData['width'] as num).toDouble(),
      sizeData['height'] is double ? sizeData['height'] : (sizeData['height'] as num).toDouble(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // Safely extract widget type with fallback
    final String widgetType = widget.widgetData.containsKey('t') && 
                            widget.widgetData['t'] != null ? 
                            widget.widgetData['t'].toString() : 'Unknown';
    
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: () {
          widget.onWidgetSelected(widget.widgetData);
        },
        onPanUpdate: (details) {
          setState(() {
            position = Offset(
              position.dx + details.delta.dx,
              position.dy + details.delta.dy,
            );
            
            // Update the position in the widget data
            widget.widgetData['designPosition'] = {
              'x': position.dx,
              'y': position.dy,
            };
          });
        },
        child: DragTarget<String>(
          builder: (context, candidateData, rejectedData) {
            return Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: widget.isSelected ? Colors.blue : Colors.grey,
                      width: widget.isSelected ? 2.0 : 1.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Widget preview
                      Positioned.fill(
                        child: _buildWidgetPreview(widgetType),
                      ),
                      
                      // Widget label
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          color: widget.isSelected ? Colors.blue : Colors.grey,
                          child: Text(
                            widgetType,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      
                      // Child widgets
                      _buildChildWidgets(),
                      
                      // Overlay for when dragging (if this is a container)
                      if (isContainer && candidateData.isNotEmpty)
                        Positioned.fill(
                          child: Container(
                            color: Colors.green.withOpacity(0.3),
                            child: const Center(
                              child: Text(
                                'Drop to add as child',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                
                // Resize handle
                if (widget.isSelected)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          size = Size(
                            size.width + details.delta.dx,
                            size.height + details.delta.dy,
                          );
                          
                          // Update the size in the widget data
                          widget.widgetData['designSize'] = {
                            'width': size.width,
                            'height': size.height,
                          };
                        });
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.blue,
                        child: const Icon(
                          Icons.open_with,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
          onWillAccept: (data) {
            // Only accept drops if this is a container widget
            return isContainer;
          },
          onAccept: (String widgetType) {
            _addChildWidget(widgetType);
          },
        ),
      ),
    );
  }
  
  void _addChildWidget(String widgetType) {
    print('Adding widget $widgetType to container ${widget.widgetData['t']}');
    
    setState(() {
      // Get the widget data for the dropped widget type
      Map<String, dynamic> newWidgetData;
      
      // Get widget data from App Constants (safer)
      newWidgetData = Map<String, dynamic>.from(AppConstants.supportedWidgetsMap[widgetType] ?? {});
      
      if (newWidgetData.isNotEmpty) {
        final containerType = widget.widgetData['t'] as String;
        print('Container type: $containerType');
        
        // Handle single-child widgets
        if (['Container', 'Sized Box', 'Center', 'Padding', 'Decorated Box'].contains(containerType)) {
          print('Adding to single-child container');
          // Widgets that use 'child' instead of 'children'
          widget.widgetData['child'] = newWidgetData;
          
          // Give it a reasonable position and size
          newWidgetData['designPosition'] = {
            'x': 10.0,
            'y': 10.0,
          };
          newWidgetData['designSize'] = {
            'width': size.width - 20,
            'height': size.height - 20,
          };
        } 
        // Handle multi-child widgets
        else if (['Row', 'Column', 'Stack', 'MultiPage', 'Page'].contains(containerType)) {
          print('Adding to multi-child container');
          // Initialize children list if not exists
          if (!widget.widgetData.containsKey('children')) {
            widget.widgetData['children'] = [];
          } else if (widget.widgetData['children'] == null) {
            widget.widgetData['children'] = [];
          }
          
          // Use relative position within this container
          newWidgetData['designPosition'] = {
            'x': 10.0,
            'y': 10.0 + ((widget.widgetData['children'] as List).length * 10.0),
          };
          
          // Size based on container type
          if (containerType == 'Row') {
            // For Row, make height almost full height and divide width by children count + 1
            final childrenCount = (widget.widgetData['children'] as List).length;
            newWidgetData['designSize'] = {
              'width': (size.width - 20) / (childrenCount + 1),
              'height': size.height - 20,
            };
          } else if (containerType == 'Column') {
            // For Column, make width almost full width and divide height by children count + 1
            final childrenCount = (widget.widgetData['children'] as List).length;
            newWidgetData['designSize'] = {
              'width': size.width - 20,
              'height': (size.height - 20) / (childrenCount + 1),
            };
          } else {
            // Default size for other containers
            newWidgetData['designSize'] = {
              'width': size.width - 20,
              'height': size.height - 20,
            };
          }
          
          // Add to children list
          print('Adding widget to children list, count before: ${(widget.widgetData['children'] as List).length}');
          (widget.widgetData['children'] as List).add(newWidgetData);
          print('New children count: ${(widget.widgetData['children'] as List).length}');
        } else {
          print('Container type not recognized: $containerType');
        }
      } else {
        print('Widget data was empty for: $widgetType');
      }
      
      // Notify up the chain that we need to update the document structure
      _updateDocumentStructure();
    });
  }
  
  // Method to update document structure
  void _updateDocumentStructure() {
    // This will update the document structure to reflect the changes
    // The idea is to notify the parent DesignCanvas, and all the way up to the DesignerWidget
    print('Updating document structure after adding child widget');
    
    // When we select the parent widget, this should trigger an update in the UI
    widget.onWidgetSelected(widget.widgetData);
  }
  
  Widget _buildChildWidgets() {
    final List<Widget> childWidgets = [];
    
    try {
      // Handle 'children' property
      if (widget.widgetData.containsKey('children') && 
          widget.widgetData['children'] is List &&
          (widget.widgetData['children'] as List).isNotEmpty) {
        
        final children = widget.widgetData['children'] as List;
        
        for (var i = 0; i < children.length; i++) {
          try {
            // Safety check to ensure child is a Map
            if (children[i] is Map) {
              final childWidget = Map<String, dynamic>.from(children[i] as Map);
              
              // Ensure the child has a type
              if (!childWidget.containsKey('t') || childWidget['t'] == null) {
                childWidget['t'] = 'Unknown';
              }
              
              childWidgets.add(
                DesignWidgetItem(
                  key: ValueKey('child-$i'),
                  widgetData: childWidget,
                  parentList: children,
                  documentStructure: widget.documentStructure,
                  isSelected: false, // Selection will be handled by parent
                  onWidgetSelected: widget.onWidgetSelected,
                  index: i,
                ),
              );
            }
          } catch (e) {
            print('Error building child widget at index $i: $e');
          }
        }
      }
      
      // Handle 'child' property
      if (widget.widgetData.containsKey('child') && 
          widget.widgetData['child'] is Map) {
        
        try {
          final childWidget = Map<String, dynamic>.from(widget.widgetData['child'] as Map);
          
          // Ensure the child has a type
          if (!childWidget.containsKey('t') || childWidget['t'] == null) {
            childWidget['t'] = 'Unknown';
          }
          
          childWidgets.add(
            DesignWidgetItem(
              key: const ValueKey('single-child'),
              widgetData: childWidget,
              parentList: [childWidget], // Wrap in list for consistency
              documentStructure: widget.documentStructure,
              isSelected: false, // Selection will be handled by parent
              onWidgetSelected: widget.onWidgetSelected,
              index: 0,
            ),
          );
        } catch (e) {
          print('Error building single child widget: $e');
        }
      }
    } catch (e) {
      // If any error occurs, just return an empty stack
      print('Error building child widgets: $e');
    }
    
    return Stack(children: childWidgets);
  }
  
  Widget _buildWidgetPreview(String widgetType) {
    // Simplified preview based on widget type
    switch (widgetType) {
      case 'Text':
        String? text = '';
        if (widget.widgetData.containsKey('text')) {
          text = widget.widgetData['text'].toString();
          // Remove quotes if they exist
          if (text.startsWith("'") && text.endsWith("'")) {
            text = text.substring(1, text.length - 1);
          }
        }
        return Center(child: Text(text ?? 'Text'));
        
      case 'Row':
        return Container(
          color: Colors.yellow[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.arrow_back),
              Text('Row Container'),
              Icon(Icons.arrow_forward),
            ],
          ),
        );
        
      case 'Column':
        return Container(
          color: Colors.green[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.arrow_upward),
              Text('Column Container'),
              Icon(Icons.arrow_downward),
            ],
          ),
        );
        
      case 'Container':
        return Container(
          color: Colors.blue[100],
          child: const Center(
            child: Text('Container'),
          ),
        );
        
      case 'Placeholder':
        return Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.image),
          ),
        );
        
      case 'Sized Box':
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: const Center(
            child: Text('Sized Box'),
          ),
        );
        
      case 'MultiPage':
        return Container(
          color: Colors.purple[100],
          child: const Center(
            child: Text('MultiPage Document'),
          ),
        );
        
      case 'Page':
        return Container(
          color: Colors.grey[100],
          child: const Center(
            child: Text('Page'),
          ),
        );
        
      case 'Stack':
        return Container(
          color: Colors.orange[100],
          child: const Center(
            child: Text('Stack Container'),
          ),
        );
        
      default:
        return Center(child: Text(widgetType));
    }
  }
}