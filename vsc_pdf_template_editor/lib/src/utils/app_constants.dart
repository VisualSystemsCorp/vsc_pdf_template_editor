class AppConstants {
  static const supportedWidgets = [
    'Text',
    'Sized Box',
    'Container',
    'Column',
    'Row',
    'Repeater',
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
    'compress': true,
    'verbose': false,
    'title': null,
    'author': null,
    'creator': null,
    'subject': null,
    'keywords': null,
    'producer': null,
    'children': [
      {'className': 'TplPage', 'pageFormat': 'letter', 'children': []}
    ]
  };
}
