import 'package:flutter/material.dart';

class MyExampleTabBar extends StatefulWidget {
  const MyExampleTabBar({super.key});

  @override
  _MyExampleTabBarState createState() => _MyExampleTabBarState();
}

class _MyExampleTabBarState extends State<MyExampleTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Chip(
                        label: const Text('Chip 1'),
                        backgroundColor:
                            _selectedIndex == 0 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Chip(
                        label: const Text('Chip 2'),
                        backgroundColor:
                            _selectedIndex == 1 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: Chip(
                        label: const Text('Chip 3'),
                        backgroundColor:
                            _selectedIndex == 2 ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            Text('Content for Chip 1'),
            Text('Content for Chip 2'),
            Text('Content for Chip 3'),
          ],
        ),
      ),
    );
  }
}
