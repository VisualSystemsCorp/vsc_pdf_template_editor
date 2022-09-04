import 'package:flutter/material.dart';
import 'pages/w1_page.dart';
import 'pages/w2_page.dart';
import 'pages/w3_page.dart';

void main() {
  runApp(const EditorApp());
}

class EditorApp extends StatefulWidget {
  const EditorApp({Key? key}) : super(key: key);

  @override
  State<EditorApp> createState() => _EditorAppState();
}

class _EditorAppState extends State<EditorApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VSC: PDF Editor POC',
        theme: ThemeData(colorSchemeSeed: const Color(0xFF6200EE)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('M1: JSON Structure and Rendering'),
            ),
            body: Row(
              children: <Widget>[
                LayoutBuilder(
                  builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: NavigationRail(
                            selectedIndex: _selectedIndex,
                            onDestinationSelected: (int index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            labelType: NavigationRailLabelType.selected,
                            destinations: const <NavigationRailDestination>[
                              NavigationRailDestination(
                                icon: Icon(Icons.smart_button),
                                selectedIcon: Icon(Icons.smart_button),
                                label: Text('Test Widget 1'),
                              ),
                              NavigationRailDestination(
                                icon: Icon(Icons.radio_button_checked_outlined),
                                selectedIcon:
                                    Icon(Icons.radio_button_checked_outlined),
                                label: Text('Test Widget 2'),
                              ),
                              NavigationRailDestination(
                                icon: Icon(Icons.radio_button_checked_rounded),
                                selectedIcon:
                                    Icon(Icons.radio_button_checked_rounded),
                                label: Text('Test Widget 3'),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                Expanded(
                  child: Center(
                    child: () {
                      switch (_selectedIndex) {
                        case 0:
                          return const W1Page();
                        case 1:
                          return const W2Page();
                        case 2:
                          return const W3Page();
                        default:
                          return Container();
                      }
                    }(),
                  ),
                )
              ],
            )));
  }
}
