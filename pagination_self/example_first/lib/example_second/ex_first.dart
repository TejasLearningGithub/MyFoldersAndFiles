import 'dart:developer';

import 'package:flutter/material.dart';


class ExFirst extends StatefulWidget {
  const ExFirst({super.key});

  @override
  State<ExFirst> createState() => _ExFirstState();
}

class _ExFirstState extends State<ExFirst> {
  final ScrollController scrollController = ScrollController();
  List<String> items = [];
  bool loading = false;
  bool allLoaded = false;

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
    List<String> newData = items.length >= 60
        ? []
        : List.generate(20, (index) => 'List Item ${index + items.length}');
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !loading) {
        log('New Data Call');
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination'),
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: ((context, constraints) {
              if (items.isNotEmpty) {
                return ListView.separated(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      return ListTile(
                        title: Text(items[index]),
                      );
                    } else {
                      return SizedBox(
                        width: constraints.maxWidth,
                        height: 50,
                        child: const Center(
                          child: Text('Nothing More To Load'),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                  itemCount: items.length + (allLoaded ? 1 : 0),
                );
              } else {
                return const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
          ),
          if (loading) ...[
            const Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: 80,
                width: 400,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
