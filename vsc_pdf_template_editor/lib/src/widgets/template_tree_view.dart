import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vsc_pdf_template_editor/src/stores/view_model.dart';

class TemplateTreeView extends StatefulWidget {
  const TemplateTreeView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ViewModel viewModel;

  @override
  State<TemplateTreeView> createState() => _TemplateTreeViewState();
}

class _TemplateTreeViewState extends State<TemplateTreeView> {
  late TreeController<TemplateNode> _treeController;

  @override
  void initState() {
    super.initState();
    _treeController = TreeController<TemplateNode>(
      roots: [],
      childrenProvider: (node) => node.children,
    );
  }

  @override
  void dispose() {
    _treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        // Update tree data whenever the template changes
        _treeController.roots = [_createTemplateNode(widget.viewModel.template, 'Root')];
        
        return Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Template Structure',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Divider(),
              Expanded(
                child: AnimatedTreeView<TemplateNode>(
                  treeController: _treeController,
                  nodeBuilder: (BuildContext context, TreeEntry<TemplateNode> entry) {
                    return _buildTreeNode(context, entry);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TemplateNode _createTemplateNode(dynamic value, String key) {
    final List<TemplateNode> children = [];
    
    if (value is Map<String, dynamic>) {
      // Sort keys to ensure properties come first, then child widgets
      final sortedKeys = value.keys.toList();
      sortedKeys.sort((a, b) {
        // Place 'type' first
        if (a == 't') return -1;
        if (b == 't') return 1;
        
        // Place 'children' last
        if (a == 'children') return 1;
        if (b == 'children') return -1;
        
        return a.compareTo(b);
      });

      for (final childKey in sortedKeys) {
        final childValue = value[childKey];
        if (childValue != null) {
          children.add(_createTemplateNode(childValue, childKey));
        }
      }
      
      final type = value['t'];
      final nodeName = type != null ? '$key ($type)' : key;
      
      return TemplateNode(
        name: nodeName,
        value: value,
        children: children,
        isWidget: type != null,
      );
    } else if (value is List) {
      for (int i = 0; i < value.length; i++) {
        children.add(_createTemplateNode(value[i], '[$i]'));
      }
      return TemplateNode(
        name: '$key (${value.length} items)',
        value: value,
        children: children,
        isList: true,
      );
    } else {
      // For primitive values
      final valueStr = value.toString();
      final displayValue = valueStr.length > 30 ? '${valueStr.substring(0, 30)}...' : valueStr;
      return TemplateNode(
        name: '$key: $displayValue',
        value: value,
        isPrimitive: true,
      );
    }
  }

  Widget _buildTreeNode(BuildContext context, TreeEntry<TemplateNode> entry) {
    final node = entry.node;
    
    return TreeIndentation(
      entry: entry,
      guide: const IndentGuide.connectingLines(indent: 16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              entry.isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 16,
            onPressed: entry.hasChildren ? () => _treeController.toggleExpansion(entry.node) : null,
          ),
          const SizedBox(width: 4),
          if (node.isWidget)
            const Icon(Icons.widgets, size: 16, color: Colors.blue)
          else if (node.isList)
            const Icon(Icons.format_list_bulleted, size: 16, color: Colors.orange)
          else if (node.isPrimitive)
            const Icon(Icons.text_fields, size: 16, color: Colors.grey)
          else
            const Icon(Icons.folder, size: 16, color: Colors.amber),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              node.name,
              style: _getTextStyle(node),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _getTextStyle(TemplateNode node) {
    if (node.isWidget) {
      return const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue);
    } else if (node.isList) {
      return const TextStyle(fontWeight: FontWeight.w500, color: Colors.orange);
    } else if (node.isPrimitive) {
      return const TextStyle(color: Colors.black87);
    } else {
      return const TextStyle(fontWeight: FontWeight.w500, color: Colors.amber);
    }
  }
}

class TemplateNode {
  final String name;
  final dynamic value;
  final List<TemplateNode> children;
  final bool isWidget;
  final bool isList;
  final bool isPrimitive;

  TemplateNode({
    required this.name,
    required this.value,
    this.children = const [],
    this.isWidget = false,
    this.isList = false,
    this.isPrimitive = false,
  });
}