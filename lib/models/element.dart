class ElementNode {
  final TypeNode type;
  final String name;
  final String value;
  final List<ElementNode> children;

  ElementNode({required this.type, required this.name, this.value = '', this.children = const []});

}



enum TypeNode { folder, value }

TypeNode getTypeFromString(String value) {
  switch (value) {
    case 'folder': return TypeNode.folder;
    case 'value': return TypeNode.value;
    default:
      return TypeNode.value;
  }
}

final sourceData = [
  {
    "type": "folder",
    "name": "commander",
    "children": [
      {
        "type": "folder",
        "name": "environment",
        "children": [
          {"type": "value", "name": "portal_host", "value": "https://portal.carbonrobotics.com"},
          {"type": "value", "name": "config_host", "value": "https://config.carbonrobotics.com"},
        ],
      },
      {"type": "value", "name": "mode", "value": "production"},
    ],
  },
  {
    "type": "folder",
    "name": "row1",
    "children": [
      {"type": "value", "name": "static_ip", "value": "10.10.0.1"},
    ],
  },
];
