import 'package:flutter/material.dart';

class PropertyEditor extends StatefulWidget {
  final Map<String, dynamic> widgetData;
  final Function(String property, dynamic value) onPropertyChanged;

  const PropertyEditor({
    Key? key,
    required this.widgetData,
    required this.onPropertyChanged,
  }) : super(key: key);

  @override
  State<PropertyEditor> createState() => _PropertyEditorState();
}

class _PropertyEditorState extends State<PropertyEditor> {
  late Map<String, dynamic> _properties;
  late String _widgetType;
  final _textControllers = <String, TextEditingController>{};

  @override
  void initState() {
    super.initState();
    _initProperties();
  }

  @override
  void didUpdateWidget(PropertyEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('🔄 PropertyEditor: Widget updated, checking if data changed');
    if (oldWidget.widgetData != widget.widgetData) {
      print('🔄 PropertyEditor: Widget data changed, reinitializing properties');
      _initProperties();
    } else {
      print('🔄 PropertyEditor: Widget data unchanged');
      // Even if the widget didn't change, we need to check for text property changes
      // and update the controllers to match the current widget data
      if (_widgetType == 'Text' && 
          widget.widgetData.containsKey('text') && 
          _textControllers.containsKey('text')) {
        
        final currentText = widget.widgetData['text']?.toString() ?? '';
        final controllerText = _textControllers['text']?.text ?? '';
        
        print('🔄 PropertyEditor: Comparing text values:');
        print('🔄 PropertyEditor: Widget text: $currentText');
        print('🔄 PropertyEditor: Controller text: $controllerText');
        
        if (currentText != controllerText) {
          print('🔄 PropertyEditor: Text values differ, updating controller');
          _textControllers['text']?.text = currentText;
        }
      }
    }
  }

  void _initProperties() {
    _widgetType = widget.widgetData['t'] as String;
    _properties = Map<String, dynamic>.from(widget.widgetData);
    
    print('🔍 PropertyEditor: Initializing properties for $_widgetType');
    
    // Clean up old controllers
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    _textControllers.clear();
    
    // Initialize controllers for text properties
    for (final key in _properties.keys) {
      if (_properties[key] is String || _properties[key] is num || _properties[key] is bool) {
        final text = _properties[key].toString();
        print('🔍 PropertyEditor: Setting up controller for $key with value: $text');
        
        final controller = TextEditingController(text: text);
        
        // Add listener to detect direct text changes
        controller.addListener(() {
          final newText = controller.text;
          
          // Don't trigger if the text is the same
          if (newText == text) return;
          
          print('🔍 PropertyEditor: Controller value changed for $key: $newText');
          
          // If we have a direct text property change, apply it immediately
          if (key == 'text' && _widgetType == 'Text') {
            final originalValue = _properties[key].toString();
            if (originalValue.startsWith("'") && originalValue.endsWith("'")) {
              widget.onPropertyChanged(key, "'$newText'");
            } else {
              widget.onPropertyChanged(key, newText);
            }
          }
        });
        
        _textControllers[key] = controller;
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Properties: $_widgetType',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => widget.onPropertyChanged('delete', null),
                    tooltip: 'Delete Widget',
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => widget.onPropertyChanged('close', null),
                    tooltip: 'Close',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          Expanded(
            child: ListView(
              children: _buildPropertyEditors(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPropertyEditors() {
    final List<Widget> editors = [];
    
    // Skip certain internal properties
    const skipProperties = ['t', 'designPosition', 'designSize'];
    
    _properties.forEach((key, value) {
      if (!skipProperties.contains(key)) {
        if (value is String) {
          editors.add(_buildStringEditor(key, value));
        } else if (value is num) {
          editors.add(_buildNumberEditor(key, value));
        } else if (value is bool) {
          editors.add(_buildBooleanEditor(key, value));
        } else if (value is Map) {
          // Handle nested objects with an expandable tile
          if (key == 'style') {
            editors.add(_buildStyleEditor(key, value));
          } else {
            editors.add(_buildNestedPropertyEditor(key, value));
          }
        }
      }
    });
    
    return editors;
  }

  Widget _buildStringEditor(String property, String value) {
    // Special handling for text property of Text widget
    if (property == 'text' && _widgetType == 'Text') {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextField(
          controller: _textControllers[property],
          decoration: InputDecoration(
            labelText: property,
            border: const OutlineInputBorder(),
            helperText: "For fixed text, use quotes: 'my text'",
          ),
          onChanged: (newValue) {
            print('📝 PropertyEditor: Text changed: $newValue');
            
            // IMPORTANT FIX: remove any existing quotes from the newValue
            String cleanValue = newValue;
            if (newValue.startsWith("'") && newValue.endsWith("'")) {
              cleanValue = newValue.substring(1, newValue.length - 1);
            }
            
            // Format value correctly - ensure single quotes for text values
            print('📝 PropertyEditor: Clean value: $cleanValue');
            final formattedValue = "'$cleanValue'";
            print('📝 PropertyEditor: Formatted value: $formattedValue');
            
            // Update with the properly formatted value
            widget.onPropertyChanged(property, formattedValue);
            
            // Force focus loss and apply changes after a short delay
            Future.delayed(const Duration(milliseconds: 200), () {
              FocusScope.of(context).unfocus();
            });
          },
          onEditingComplete: () {
            // Ensure the update is applied when editing is complete
            final newValue = _textControllers[property]!.text;
            
            // IMPORTANT FIX: remove any existing quotes from the newValue
            String cleanValue = newValue;
            if (newValue.startsWith("'") && newValue.endsWith("'")) {
              cleanValue = newValue.substring(1, newValue.length - 1);
            }
            
            // Always format as quoted text
            final formattedValue = "'$cleanValue'";
            print('📝 PropertyEditor: On complete, formatted value: $formattedValue');
            
            widget.onPropertyChanged(property, formattedValue);
          },
        ),
      );
    }
    
    // Default string editor for other properties
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: _textControllers[property],
        decoration: InputDecoration(
          labelText: property,
          border: const OutlineInputBorder(),
        ),
        onChanged: (newValue) {
          widget.onPropertyChanged(property, newValue);
        },
        onEditingComplete: () {
          // Ensure the update is applied when editing is complete
          widget.onPropertyChanged(property, _textControllers[property]!.text);
        },
      ),
    );
  }

  Widget _buildNumberEditor(String property, num value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: _textControllers[property],
        decoration: InputDecoration(
          labelText: property,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        onChanged: (newValue) {
          if (newValue.isNotEmpty) {
            // Try to parse as integer first, then as double if that fails
            try {
              final intValue = int.parse(newValue);
              widget.onPropertyChanged(property, intValue);
            } catch (_) {
              try {
                final doubleValue = double.parse(newValue);
                widget.onPropertyChanged(property, doubleValue);
              } catch (_) {
                // If all parsing fails, keep the original value
                widget.onPropertyChanged(property, value);
              }
            }
          } else {
            // Empty string, set to 0
            widget.onPropertyChanged(property, 0);
          }
        },
        onEditingComplete: () {
          // Ensure the update is applied when editing is complete
          final newValue = _textControllers[property]!.text;
          if (newValue.isNotEmpty) {
            try {
              final intValue = int.parse(newValue);
              widget.onPropertyChanged(property, intValue);
            } catch (_) {
              try {
                final doubleValue = double.parse(newValue);
                widget.onPropertyChanged(property, doubleValue);
              } catch (_) {
                // If all parsing fails, keep the original value
                widget.onPropertyChanged(property, value);
              }
            }
          } else {
            widget.onPropertyChanged(property, 0);
          }
        },
      ),
    );
  }

  Widget _buildBooleanEditor(String property, bool value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(property),
          const Spacer(),
          Switch(
            value: value,
            onChanged: (newValue) {
              widget.onPropertyChanged(property, newValue);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStyleEditor(String property, Map value) {
    return ExpansionTile(
      title: Text(property),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildStyleProperties(value),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildStyleProperties(Map styleData) {
    final List<Widget> styleEditors = [];
    
    styleData.forEach((key, value) {
      if (value is String) {
        // For color properties, we can add a color picker later
        if (key == 'color') {
          styleEditors.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Text(key),
                  const Spacer(),
                  // Simple text field for now, can be replaced with color picker
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: TextEditingController(text: value),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        final updatedStyle = Map<String, dynamic>.from(styleData);
                        updatedStyle[key] = newValue;
                        widget.onPropertyChanged('style', updatedStyle);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          styleEditors.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Text(key),
                  const Spacer(),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: TextEditingController(text: value),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        final updatedStyle = Map<String, dynamic>.from(styleData);
                        updatedStyle[key] = newValue;
                        widget.onPropertyChanged('style', updatedStyle);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      } else if (value is num) {
        styleEditors.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(key),
                const Spacer(),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: TextEditingController(text: value.toString()),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (newValue) {
                      if (newValue.isNotEmpty) {
                        final updatedStyle = Map<String, dynamic>.from(styleData);
                        updatedStyle[key] = double.tryParse(newValue) ?? value;
                        widget.onPropertyChanged('style', updatedStyle);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
    
    return styleEditors;
  }

  Widget _buildNestedPropertyEditor(String property, Map value) {
    return ExpansionTile(
      title: Text(property),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildNestedProperties(property, value),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildNestedProperties(String parentProperty, Map nestedData) {
    final List<Widget> nestedEditors = [];
    
    nestedData.forEach((key, value) {
      if (value is String) {
        nestedEditors.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(key),
                const Spacer(),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: TextEditingController(text: value),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      final updatedNested = Map<String, dynamic>.from(nestedData);
                      updatedNested[key] = newValue;
                      widget.onPropertyChanged(parentProperty, updatedNested);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (value is num) {
        nestedEditors.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(key),
                const Spacer(),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: TextEditingController(text: value.toString()),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (newValue) {
                      if (newValue.isNotEmpty) {
                        final updatedNested = Map<String, dynamic>.from(nestedData);
                        updatedNested[key] = double.tryParse(newValue) ?? value;
                        widget.onPropertyChanged(parentProperty, updatedNested);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (value is bool) {
        nestedEditors.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(key),
                const Spacer(),
                Switch(
                  value: value,
                  onChanged: (newValue) {
                    final updatedNested = Map<String, dynamic>.from(nestedData);
                    updatedNested[key] = newValue;
                    widget.onPropertyChanged(parentProperty, updatedNested);
                  },
                ),
              ],
            ),
          ),
        );
      }
    });
    
    return nestedEditors;
  }
}