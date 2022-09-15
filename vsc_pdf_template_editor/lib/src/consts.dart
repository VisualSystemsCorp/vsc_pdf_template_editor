const String widgetJson =
    '{"className":"TplText","text":"sample text","style":{"color":"00FF00"},"textAlign":"left","textDirection":"ltr","softWrap":true,"tightBounds":true,"textScaleFactor":2,"maxLines":3,"overflow":"span"}';

const List<Map<String, dynamic>> widgets = [
  {
    'key': '101',
    'label': 'Document',
    'children': [
      {
        'key': '102',
        'label': 'Page',
        'children': [
          {'key': '103',
            'label': 'Widget',
            'data': 'simple text'}
        ]
      }
    ]
  }
];
