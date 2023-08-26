import 'package:flutter/material.dart';

class WidgetPaginationSecond extends StatefulWidget {
  const WidgetPaginationSecond({super.key});

  @override
  State<WidgetPaginationSecond> createState() => _WidgetPaginationSecondState();
}

class _WidgetPaginationSecondState extends State<WidgetPaginationSecond> {
  ScrollController scrollController = ScrollController();
  bool isLoading = false, allLoaded = false;
  List<String> items = [];

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    List<String> newData = items.length >= 60
        ? []
        : List.generate(20, (index) => 'Item Number ${index + items.length}');
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }
    setState(() {
      isLoading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    mockFetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        mockFetch();
      }
    });
    super.initState();
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
        title: const Text('Pagination Example'),
      ),
      body: Stack(children: [
        LayoutBuilder(
          builder: (context, constraints) {
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
                        child: Text('No More Content'),
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
          },
        ),
        if (isLoading && items.length > 1) ...[
          const Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: 50,
              width: 400,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        ]
      ]),
    );
  }
}
