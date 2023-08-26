import 'package:flutter/material.dart';

class Item {
  final String name;
  final Color color;

  Item(this.name, this.color);
}

void main() => runApp(const MaterialApp(home: ListDemo()));

class ListDemo extends StatefulWidget {
  const ListDemo({super.key});

  @override
  State<StatefulWidget> createState() => ListDemoState();
}

class ListDemoState extends State<ListDemo> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    items = [
      Item('Apple', Colors.red),
      Item('Banana', Colors.yellow),
      Item('Cherry', Colors.pink),
      Item('Date', Colors.brown),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KindaCode.com"),
      ),
      body: ReorderableListView(
        children: items
            .map((item) => ListTile(
                  key: ObjectKey(item),
                  title: Text(item.name),
                  iconColor: item.color,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => setState(() => items.remove(item)),
                  ),
                ))
            .toList(),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
