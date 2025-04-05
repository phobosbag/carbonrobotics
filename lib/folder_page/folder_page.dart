import 'package:flutter/material.dart';

import '../models/element.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  final List<ElementNode> data = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ElementNode parseFromJson(Map e) {
        return ElementNode(
          type: getTypeFromString(e['type'].toString()),
          name: e['name'].toString(),
          value: (e['value'] as String?) ?? '',
          children: ((e['children'] as List?) ?? []).map((c) => parseFromJson(c)).toList(),
        );
      }

      data.addAll(sourceData.map((e) => parseFromJson(e)));

      for (var e in data) {
        print(e.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text('Folder')),
      body: Column(
        children: [
          ...data.map(
            (d) => ElementNodeWidget(
              elementNode: d,
              padding: 0,
              onChange: (String value) {
                print('NEW value $value');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ElementNodeWidget extends StatefulWidget {
  final ElementNode elementNode;
  final int padding;
  final Function(String) onChange;

  const ElementNodeWidget({super.key, required this.elementNode, required this.padding, required this.onChange});

  @override
  State<ElementNodeWidget> createState() => ElementNodeWidgetState();
}

class ElementNodeWidgetState extends State<ElementNodeWidget> {
  bool isExpanded = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.elementNode.type == TypeNode.value)  {
          TextEditingController controller = TextEditingController(text: widget.elementNode.value);
          await showBottomSheet(
            context: context,
            builder: (context) {

              return Column(
                children: [
                  SizedBox(height: 16),
                  Text(widget.elementNode.name, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                  TextField(controller: controller),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          widget.onChange(controller.text);
                        },
                        child: Text('Save'),
                      ),
                      SizedBox(width: 16),

                      TextButton(onPressed: () {
                        Navigator.of(context).pop();
                      }, child: Text('Cancel')),
                    ],
                  ),
                ],
              );
            },
          );
          controller.dispose();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(widget.padding * 8.0),
        child: Builder(
          builder: (context) {
            if (widget.elementNode.type == TypeNode.folder)
            return ExpansionTile(
              onExpansionChanged: (value) {
                isExpanded = value;
              },
              leading:
                  widget.elementNode.type == TypeNode.value
                      ? SizedBox(width: 30)
                      : IconButton(onPressed: () {}, icon: isExpanded ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_right_outlined)),
              title: Text(widget.elementNode.name),
              subtitle: Column(
                children: [
                  // Text(widget.elementNode.type.toString()),
                  if (widget.elementNode.type == TypeNode.value) Text(widget.elementNode.value),
                ],
              ),
              children: [
                ...widget.elementNode.children.map(
                  (c) => ElementNodeWidget(
                    elementNode: c,
                    padding: widget.padding + 1,
                    onChange: (String value) {
                      print('NEW value $value');
                    },
                  ),
                ),
              ],
            );               return ListTile(
              leading:
              widget.elementNode.type == TypeNode.value
                  ? SizedBox(width: 30)
                  : IconButton(onPressed: () {}, icon: isExpanded ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_right_outlined)),
              title: Text(widget.elementNode.name),
              subtitle: Column(
                children: [
                  // Text(widget.elementNode.type.toString()),
                  if (widget.elementNode.type == TypeNode.value) Text(widget.elementNode.value),
                ],
              ),
            );

          }
        ),
      ),
    );
  }
}
