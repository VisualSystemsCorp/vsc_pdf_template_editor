class AppConstants {
  static const supportedWidgets = [
    'Text',
    'Sized Box',
    'Container',
    'Column',
    'Row',
  ];
  static const supportedProperties = {
    'Container': [
      'Alignment',
      'Padding',
      'Decoration',
      'Foreground decoration',
      'Constraints',
      'Margin'
    ]
  };

  static const Map<String, dynamic> rootTemplate = {
    'className': 'TplDocument',
    'pageMode': 'none',
    'children': [
      {'className': 'TplPage', 'pageFormat': 'letter', 'children': []}
    ]
  };
}
