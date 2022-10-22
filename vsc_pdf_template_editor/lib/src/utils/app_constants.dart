class AppConstants {
  static const supportedWidgets = [
    'Text',
    'Sized Box',
    'Container',
    'Column',
    'Row',
  ];
  static const supportedProperties = [
    'Alignment',
    'Edge Insets',
    'Box Decoration',
    'Radius',
    'Box Border',
    'Box Constraints',
    'Border Style',
    'Border Radius',
    'Border Side',
    'Text Style',
  ];

  static const Map<String, dynamic> rootTemplate = {
    'className': 'TplDocument',
    'pageMode': 'none',
    'children': [
      {'className': 'TplPage', 'pageFormat': 'letter', 'children': []}
    ]
  };
}
