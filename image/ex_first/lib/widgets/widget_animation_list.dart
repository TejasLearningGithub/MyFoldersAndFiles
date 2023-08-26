import 'package:flutter/material.dart';

class WidgetAnimatedList extends StatefulWidget {
  const WidgetAnimatedList({super.key});

  @override
  State<WidgetAnimatedList> createState() => _WidgetAnimatedListState();
}

class _WidgetAnimatedListState extends State<WidgetAnimatedList> {
  final item = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  void addItem() {
    item.insert(0, 'Item ${item.length + 1}');
    key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  void removeItem(int index) {
    key.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text(
              'Item Has Been Deleted',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    item.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List Widget'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          IconButton(onPressed: addItem, icon: const Icon(Icons.add)),
          Expanded(
            child: AnimatedList(
              key: key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  key: UniqueKey(),
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.orangeAccent,
                    child: ListTile(
                      title: Text('${item[index]}'),
                      trailing: IconButton(
                        onPressed: () {
                          removeItem(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
