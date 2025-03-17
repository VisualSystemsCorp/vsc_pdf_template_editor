import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/view_model.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_editor/src/widgets/designer/design_canvas.dart';
import 'package:vsc_pdf_template_editor/src/widgets/designer/widget_palette.dart';
import 'package:vsc_pdf_template_editor/src/widgets/designer/property_editor.dart';

class DesignerWidget extends StatefulWidget {
  const DesignerWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _DesignerWidgetState();
}

class _DesignerWidgetState extends State<DesignerWidget> {
  Map<String, dynamic>? _selectedWidget;
  final Map<String, dynamic> _documentStructure = {};
  
  @override
  void initState() {
    super.initState();
    // Initialize document structure based on the template
    _initializeDocumentStructure();
  }
  
  void _initializeDocumentStructure() {
    // Check if the template has content
    bool isEmptyTemplate = widget.viewModel.template.isEmpty ||
                          (widget.viewModel.template.containsKey('children') && 
                           (widget.viewModel.template['children'] as List).isEmpty);
    
    if (isEmptyTemplate) {
      // Create a default template with MultiPage and Page
      _documentStructure['t'] = 'Document';
      _documentStructure['pageMode'] = "'none'";
      _documentStructure['children'] = [];
      
      // Create MultiPage widget
      final multiPage = Map<String, dynamic>.from(AppConstants.supportedWidgetsMap['MultiPage'] ?? {});
      multiPage['designPosition'] = {'x': 50.0, 'y': 50.0};
      multiPage['designSize'] = {'width': 500.0, 'height': 700.0};
      
      // Create Page widget as child of MultiPage
      final page = Map<String, dynamic>.from(AppConstants.supportedWidgetsMap['Page'] ?? {});
      page['designPosition'] = {'x': 10.0, 'y': 10.0};
      page['designSize'] = {'width': 480.0, 'height': 680.0};
      
      // Add page format
      page['pageFormat'] = {
        'format': "'a4'"
      };
      
      // Initialize children for MultiPage
      if (!multiPage.containsKey('children')) {
        multiPage['children'] = [];
      }
      
      // Add Page to MultiPage
      multiPage['children'].add(page);
      
      // Add MultiPage to document
      _documentStructure['children'].add(multiPage);
    } else {
      // Clone the existing template structure
      _documentStructure.addAll(widget.viewModel.template);
    }
    
    // Make sure supported widgets are accessible in the document structure
    if (!_documentStructure.containsKey('supportedWidgets')) {
      _documentStructure['supportedWidgets'] = AppConstants.supportedWidgetsMap;
    }
    
    // Ensure we have a document type
    if (!_documentStructure.containsKey('t')) {
      _documentStructure['t'] = 'Document';
    }
    
    // Initialize children array if needed
    if (!_documentStructure.containsKey('children')) {
      _documentStructure['children'] = [];
    }
    
    // After initialization, update the template to ensure it's in sync
    _updateTemplate();
  }
  
  void _onWidgetSelected(Map<String, dynamic> widgetData) {
    setState(() {
      _selectedWidget = widgetData;
    });
  }
  
  void _onPropertyChanged(String property, dynamic value) {
    if (_selectedWidget != null) {
      if (property == 'close') {
        // Close the property panel
        setState(() {
          _selectedWidget = null;
        });
      } else if (property == 'delete') {
        // Delete the selected widget
        _deleteSelectedWidget();
      } else {
        print('⚠️ DIRECT PROPERTY UPDATE: $property = $value');
        
        // COMPLETELY NEW APPROACH:
        // 1. Make a deep copy of the template from the view model
        // 2. Find and update the selected widget in the copy
        // 3. Update the view model with the complete new template
        
        try {
          // Get a fresh copy of the template from the view model
          final templateJson = widget.viewModel.getTemplateJson();
          final updatedTemplate = Map<String, dynamic>.from(jsonDecode(templateJson));
          
          // Find and update the widget in this fresh template
          bool updated = false;
          
          // Function to find and update the widget by matching properties
          bool updateWidgetInStructure(Map<String, dynamic> container) {
            // Check for direct match with the container itself
            if (_isMatchingWidget(container, _selectedWidget!)) {
              // This is our widget - update the property
              container[property] = value;
              print('✅ Found and updated widget directly!');
              return true;
            }
            
            // Look in 'children' array
            if (container.containsKey('children') && container['children'] is List) {
              final List children = container['children'];
              for (int i = 0; i < children.length; i++) {
                if (children[i] is Map<String, dynamic>) {
                  if (_isMatchingWidget(children[i], _selectedWidget!)) {
                    // Found the matching widget - update the property
                    children[i][property] = value;
                    print('✅ Found and updated widget in children!');
                    return true;
                  }
                  
                  // Recursively search in this child
                  if (updateWidgetInStructure(children[i])) {
                    return true;
                  }
                }
              }
            }
            
            // Check 'child' property
            if (container.containsKey('child') && container['child'] is Map<String, dynamic>) {
              if (_isMatchingWidget(container['child'], _selectedWidget!)) {
                // Found the matching widget - update the property
                container['child'][property] = value;
                print('✅ Found and updated widget in child!');
                return true;
              }
              
              // Recursively search in this child
              if (updateWidgetInStructure(container['child'])) {
                return true;
              }
            }
            
            return false;
          }
          
          // Start the search and update process
          updated = updateWidgetInStructure(updatedTemplate);
          
          if (updated) {
            print('🔄 Updating template with the updated widget');
            // Convert the updated template to a string
            final updatedJson = jsonEncode(updatedTemplate);
            
            // Update the view model directly with this new JSON
            widget.viewModel.setTemplateControllerTextDirectly(
                widget.viewModel.getPrettyPrintedJson(updatedJson));
                
            // Force PDF rebuild
            widget.viewModel.forceTemplateBuild();
            
            // Update the state to refresh the UI
            setState(() {
              // Update the selected widget reference from the updated template
              // This is important to keep things in sync
              _findAndUpdateSelectedWidget(updatedTemplate);
            });
            
            print('✅ Template updated successfully!');
          } else {
            print('❌ Could not find the selected widget in the template!');
          }
        } catch (e, stack) {
          print('❌ Error updating property: $e');
          print('Stack: $stack');
        }
      }
    }
  }
  
  // Helper method to check if two widgets match
  bool _isMatchingWidget(Map<String, dynamic> widget1, Map<String, dynamic> widget2) {
    // First check if they have the same type
    if (widget1['t'] != widget2['t']) {
      return false;
    }
    
    // For Text widgets, also check the position to be more precise
    if (widget1['t'] == 'Text' && 
        widget1.containsKey('designPosition') && 
        widget2.containsKey('designPosition')) {
      final pos1 = widget1['designPosition'];
      final pos2 = widget2['designPosition'];
      
      if (pos1['x'] == pos2['x'] && pos1['y'] == pos2['y']) {
        return true;
      }
    }
    
    // For other widgets, just check if they have the same position
    if (widget1.containsKey('designPosition') && 
        widget2.containsKey('designPosition')) {
      final pos1 = widget1['designPosition'];
      final pos2 = widget2['designPosition'];
      
      if (pos1['x'] == pos2['x'] && pos1['y'] == pos2['y']) {
        return true;
      }
    }
    
    // If we reach here, the widgets don't match
    return false;
  }
  
  // Find and update the selected widget reference
  void _findAndUpdateSelectedWidget(Map<String, dynamic> template) {
    // Function to search for the widget
    Map<String, dynamic>? findWidget(Map<String, dynamic> container) {
      // Check for direct match with the container
      if (_isMatchingWidget(container, _selectedWidget!)) {
        return container;
      }
      
      // Look in 'children' array
      if (container.containsKey('children') && container['children'] is List) {
        final List children = container['children'];
        for (int i = 0; i < children.length; i++) {
          if (children[i] is Map<String, dynamic>) {
            if (_isMatchingWidget(children[i], _selectedWidget!)) {
              return children[i];
            }
            
            // Recursively search in this child
            final result = findWidget(children[i]);
            if (result != null) {
              return result;
            }
          }
        }
      }
      
      // Check 'child' property
      if (container.containsKey('child') && container['child'] is Map<String, dynamic>) {
        if (_isMatchingWidget(container['child'], _selectedWidget!)) {
          return container['child'];
        }
        
        // Recursively search in this child
        final result = findWidget(container['child']);
        if (result != null) {
          return result;
        }
      }
      
      return null;
    }
    
    // Search for the widget and update the reference if found
    final found = findWidget(template);
    if (found != null) {
      _selectedWidget = found;
    }
  }
  
  void _deleteSelectedWidget() {
    if (_selectedWidget == null) return;
    
    print('Attempting to delete widget: ${_selectedWidget!['t']}');
    
    setState(() {
      // Find the parent list that contains this widget
      bool removed = false;
      
      // If the widget is directly in the document structure, we can't remove it
      // because we need at least a root-level widget. Skip this case.
      
      // Instead, search through all containers to find and remove the widget
      removed = _searchAndRemoveWidget(_documentStructure, _selectedWidget!);
      
      print('Widget ${removed ? 'was' : 'was NOT'} removed');
      
      // Clear the selection after deletion
      _selectedWidget = null;
      
      // Update the template
      _updateTemplate();
    });
  }
  
  bool _searchAndRemoveWidget(Map<String, dynamic> container, Map<String, dynamic> widgetToRemove) {
    print("Searching in container: ${container['t']}");
    
    // Print the widget we're trying to remove
    print("Widget to remove type: ${widgetToRemove['t']}");
    print("Widget to remove position: ${widgetToRemove['designPosition']}");
    
    // Check children arrays
    if (container.containsKey('children') && container['children'] is List) {
      final children = container['children'] as List;
      print("Container has ${children.length} children");
      
      // Find widget in children list by comparing references or content
      for (int i = 0; i < children.length; i++) {
        if (children[i] is! Map) continue;
        
        final childMap = children[i] as Map;
        print("Checking child $i: ${childMap['t']}");
        
        // First check: is it the same object?
        if (identical(children[i], widgetToRemove)) {
          print('Removing widget at index $i from children list (identical object)');
          children.removeAt(i);
          return true;
        }
        
        // Second check: does it have the same position?
        if (childMap.containsKey('designPosition') && 
            childMap['designPosition'] != null &&
            widgetToRemove.containsKey('designPosition') && 
            widgetToRemove['designPosition'] != null) {
            
          final childPos = childMap['designPosition'];
          final removePos = widgetToRemove['designPosition'];
          
          print("Child position: $childPos");
          print("Widget to remove position: $removePos");
          
          // Compare positions
          if (childPos['x'] == removePos['x'] && 
              childPos['y'] == removePos['y']) {
            print('Removing widget at index $i from children list (matching position)');
            children.removeAt(i);
            return true;
          }
        }
        
        // Third check: does it have the same type and properties?
        if (childMap['t'] == widgetToRemove['t']) {
          // For text widgets, also check the text content
          if (childMap['t'] == 'Text' && 
              childMap.containsKey('text') && 
              widgetToRemove.containsKey('text') &&
              childMap['text'] == widgetToRemove['text']) {
            print('Removing widget at index $i from children list (matching Text and content)');
            children.removeAt(i);
            return true;
          }
        }
      }
      
      // Recursively check each child
      for (int i = 0; i < children.length; i++) {
        if (children[i] is Map<String, dynamic>) {
          final child = children[i] as Map<String, dynamic>;
          if (_searchAndRemoveWidget(child, widgetToRemove)) {
            return true;
          }
        }
      }
    }
    
    // Check single child property
    if (container.containsKey('child') && 
        container['child'] is Map<String, dynamic>) {
        
      final child = container['child'] as Map<String, dynamic>;
      
      print("Checking 'child' property: ${child['t']}");
      
      // Is it the same object?
      if (identical(child, widgetToRemove)) {
        print('Removing widget from child property (identical object)');
        container.remove('child');
        return true;
      }
      
      // Does it have the same position?
      if (child.containsKey('designPosition') && 
          child['designPosition'] != null &&
          widgetToRemove.containsKey('designPosition') && 
          widgetToRemove['designPosition'] != null) {
          
        final childPos = child['designPosition'];
        final removePos = widgetToRemove['designPosition'];
        
        // Compare positions
        if (childPos['x'] == removePos['x'] && 
            childPos['y'] == removePos['y']) {
          print('Removing widget from child property (matching position)');
          container.remove('child');
          return true;
        }
      }
      
      // Check for text widgets specifically
      if (child['t'] == 'Text' && widgetToRemove['t'] == 'Text' &&
          child.containsKey('text') && widgetToRemove.containsKey('text') &&
          child['text'] == widgetToRemove['text']) {
        print('Removing Text widget from child property (matching content)');
        container.remove('child');
        return true;
      }
      
      // Recursively check the child
      if (_searchAndRemoveWidget(child, widgetToRemove)) {
        return true;
      }
    }
    
    return false;
  }
  
  void _updateTemplate() {
    try {
      print('🛠️ Designer: Starting template update process');
      
      // Create a clean deep copy of the document structure
      Map<String, dynamic> cleanStructure = _cleanDocumentStructure();
      
      // Ensure we still have a valid document structure
      _ensureValidDocument(cleanStructure);
      
      // Print a portion of the document structure for debugging
      print('🛠️ Designer: Document structure sample: ${_documentStructure.keys}');
      if (_selectedWidget != null) {
        print('🛠️ Designer: Selected widget properties: ${_selectedWidget!.keys}');
        if (_selectedWidget!.containsKey('text')) {
          print('🛠️ Designer: Selected widget text: ${_selectedWidget!['text']}');
        }
      }
      
      // Force immediate update of template in view model
      print('🛠️ Designer: Updating view model template...');
      widget.viewModel.updateTemplateFromDesigner(cleanStructure);
      
      // Force a rebuild
      widget.viewModel.forceTemplateBuild();
      
      print('🛠️ Designer: Template update process complete');
    } catch (e, stack) {
      print('‼️ Error updating template: $e');
      print('Stack trace: $stack');
    }
  }
  
  Map<String, dynamic> _cleanDocumentStructure() {
    // Create a new map to hold the cleaned structure
    Map<String, dynamic> cleaned = {};
    
    // Copy essential document properties
    if (_documentStructure.containsKey('t')) {
      cleaned['t'] = _documentStructure['t'];
    } else {
      cleaned['t'] = 'Document';
    }
    
    if (_documentStructure.containsKey('pageMode')) {
      cleaned['pageMode'] = _documentStructure['pageMode'];
    }
    
    // Copy and clean children
    cleaned['children'] = [];
    if (_documentStructure.containsKey('children') && 
        _documentStructure['children'] is List) {
      
      final sourceChildren = _documentStructure['children'] as List;
      for (final child in sourceChildren) {
        if (child is Map<String, dynamic>) {
          // Recursively clean each child
          cleaned['children'].add(_cleanWidget(child));
        }
      }
    }
    
    return cleaned;
  }
  
  Map<String, dynamic> _cleanWidget(Map<String, dynamic> widget) {
    Map<String, dynamic> cleaned = {};
    
    // Copy widget type
    if (widget.containsKey('t')) {
      cleaned['t'] = widget['t'];
    } else {
      cleaned['t'] = 'Unknown';
    }
    
    // Copy design properties but don't include them in the final output
    if (widget.containsKey('designPosition')) {
      cleaned['designPosition'] = Map<String, dynamic>.from(widget['designPosition'] as Map);
    }
    
    if (widget.containsKey('designSize')) {
      cleaned['designSize'] = Map<String, dynamic>.from(widget['designSize'] as Map);
    }
    
    // Copy all other properties except for special ones
    widget.forEach((key, value) {
      if (key != 't' && key != 'designPosition' && key != 'designSize' && key != 'children' && key != 'child') {
        cleaned[key] = value;
      }
    });
    
    // Handle children recursively
    if (widget.containsKey('children') && widget['children'] is List) {
      cleaned['children'] = [];
      final children = widget['children'] as List;
      for (final child in children) {
        if (child is Map<String, dynamic>) {
          cleaned['children'].add(_cleanWidget(child));
        }
      }
    }
    
    // Handle single child property recursively
    if (widget.containsKey('child') && widget['child'] is Map<String, dynamic>) {
      cleaned['child'] = _cleanWidget(widget['child'] as Map<String, dynamic>);
    }
    
    return cleaned;
  }
  
  void _ensureValidDocument(Map<String, dynamic> document) {
    // If we've removed all children, create a minimal document structure
    if (!document.containsKey('children') || 
        !(document['children'] is List) || 
        (document['children'] as List).isEmpty) {
      
      // Create a default empty document with Page
      document['children'] = [];
      
      // Create a Page widget
      final page = {
        't': 'Page',
        'pageFormat': {
          'format': "'a4'"
        }
      };
      
      // Add Page to document
      document['children'].add(page);
    }
  }
  
  void _onWidgetAdded(String widgetType, Offset position, {Map<String, dynamic>? targetContainer}) {
    final widgetData = AppConstants.supportedWidgetsMap[widgetType];
    if (widgetData != null) {
      setState(() {
        // Clone the widget data and add position information
        final newWidget = Map<String, dynamic>.from(widgetData);
        newWidget['designPosition'] = {
          'x': position.dx,
          'y': position.dy,
        };
        
        // Add default size
        newWidget['designSize'] = {
          'width': 200.0,
          'height': 100.0,
        };
        
        // If we have a target container, add the widget to that container
        if (targetContainer != null) {
          print('Adding widget to target container: ${targetContainer['t']}');
          
          // Check if the container uses 'children' array
          if (['Column', 'Row', 'Stack', 'MultiPage'].contains(targetContainer['t'])) {
            if (!targetContainer.containsKey('children')) {
              targetContainer['children'] = [];
            }
            
            // Adjust position to be relative to container
            newWidget['designPosition'] = {
              'x': 10.0,
              'y': 10.0 + ((targetContainer['children'] as List).length * 20.0)
            };
            
            // Adjust size based on container type
            if (targetContainer['t'] == 'Column') {
              newWidget['designSize'] = {
                'width': targetContainer['designSize']['width'] - 20.0,
                'height': 60.0,
              };
            } else if (targetContainer['t'] == 'Row') {
              newWidget['designSize'] = {
                'width': 60.0,
                'height': targetContainer['designSize']['height'] - 20.0,
              };
            }
            
            (targetContainer['children'] as List).add(newWidget);
          }
          // Handle containers that use 'child' property
          else if (['Container', 'SizedBox', 'Center', 'Padding'].contains(targetContainer['t'])) {
            // Center the widget in the container
            newWidget['designPosition'] = {
              'x': 10.0,
              'y': 10.0,
            };
            
            // Adjust size to fit inside container
            newWidget['designSize'] = {
              'width': targetContainer['designSize']['width'] - 20.0,
              'height': targetContainer['designSize']['height'] - 20.0,
            };
            
            targetContainer['child'] = newWidget;
          }
        } else {
          // No target container, add to root level
          if (_documentStructure['children'] == null) {
            _documentStructure['children'] = [];
          }
          
          _documentStructure['children'].add(newWidget);
        }
        
        // Make sure supported widgets are accessible in the document structure
        if (!_documentStructure.containsKey('supportedWidgets')) {
          _documentStructure['supportedWidgets'] = AppConstants.supportedWidgetsMap;
        }
        
        _updateTemplate();
      });
    }
  }
  
  // Method to find a container at the given position
  Map<String, dynamic>? _findContainerAt(Offset position) {
    // First search in top-level widgets
    if (_documentStructure.containsKey('children') && 
        _documentStructure['children'] is List) {
      
      for (final widget in _documentStructure['children']) {
        if (widget is Map<String, dynamic>) {
          final container = _isWidgetContainerAt(widget, position);
          if (container != null) return container;
        }
      }
    }
    
    return null;
  }
  
  // Check if the given widget is a container at the position
  Map<String, dynamic>? _isWidgetContainerAt(Map<String, dynamic> widget, Offset position) {
    // Skip if no position data
    if (!widget.containsKey('designPosition') || !widget.containsKey('designSize')) {
      return null;
    }
    
    final pos = widget['designPosition'];
    final size = widget['designSize'];
    
    // Create a rect for the widget
    final rect = Rect.fromLTWH(
      pos['x'],
      pos['y'],
      size['width'],
      size['height'],
    );
    
    // Check if position is within this widget
    if (rect.contains(position)) {
      // Check if it's a container type
      if (['Column', 'Row', 'Container', 'SizedBox', 'Center', 
           'Padding', 'Stack', 'MultiPage'].contains(widget['t'])) {
        return widget;
      }
      
      // If not a container itself, check its children
      if (widget.containsKey('children') && widget['children'] is List) {
        for (final child in widget['children']) {
          if (child is Map<String, dynamic>) {
            final container = _isWidgetContainerAt(child, position);
            if (container != null) return container;
          }
        }
      }
      
      // Check single child
      if (widget.containsKey('child') && widget['child'] is Map<String, dynamic>) {
        return _isWidgetContainerAt(widget['child'], position);
      }
    }
    
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Widget palette on the left
                  SizedBox(
                    width: 200,
                    child: WidgetPalette(
                      supportedWidgets: _getInitialSupportedWidgets(),
                      onWidgetDragged: (widgetType, position) {
                        // Find if there's a container at that position
                        final targetContainer = _findContainerAt(position);
                        _onWidgetAdded(widgetType, position, targetContainer: targetContainer);
                      },
                    ),
                  ),
                  
                  // Design canvas in the center
                  Expanded(
                    child: DragTarget<String>(
                      builder: (context, candidateData, rejectedData) {
                        return Stack(
                          children: [
                            // The design canvas
                            DesignCanvas(
                              documentStructure: _documentStructure,
                              onWidgetSelected: _onWidgetSelected,
                              selectedWidget: _selectedWidget,
                            ),
                            
                            // Overlay for when dragging
                            if (candidateData.isNotEmpty)
                              Container(
                                color: Colors.blue.withOpacity(0.1),
                                child: const Center(
                                  child: Text(
                                    'Drop to add widget',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                      onAccept: (String widgetType) {
                        // Get the center position of the canvas for default position
                        final center = Offset(
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 2,
                        );
                        _onWidgetAdded(widgetType, center);
                      },
                    ),
                  ),
                  
                  // Property editor on the right
                  if (_selectedWidget != null)
                    SizedBox(
                      width: 300,
                      child: PropertyEditor(
                        widgetData: _selectedWidget!,
                        onPropertyChanged: _onPropertyChanged,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  
  // Initially support just a subset of widgets
  List<String> _getInitialSupportedWidgets() {
    return [
      'Text',
      'Row',
      'Column',
      'Container',
      'Placeholder',
      'Sized Box',
    ];
  }
}