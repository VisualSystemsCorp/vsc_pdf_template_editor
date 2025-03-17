
> `vsc_pdf_template_editor` currently allows the user to edit a PDF template by editing a JSON specification on the left side, and displays a rendered PDF sample on the right. I want to have an interactive drag-and-drop designer on the left side instead. The designer should allow the user to drag and drop PDF widgets from the `pdf` package (https://pub.dev/packages/pdf). Once a widget is in the designer the user should be able to resize the widget and potentially move it using the mouse. The other attributes of the widget should appear in a pop-over pane and allow the user to edit them. This is a large change, so perhaps start by allowing the user to manipulate a subset of widgets such as Row, Column, Text, and Placeholder. The designer should generate the template JSON behind the scenes. 


Widgets have boxes:
https://pub.dev/documentation/pdf/latest/widgets/Widget-class.html

New idea:
- Tree of widgets on the left
- PDF preview in the middle. Preview has an overlay that allows tapping on widget bounding boxes, and scrolls to the widget in the tree, and shows the widget properties on the right.
- Properties on the right
- Similar to https://www.flutterflow.io/
