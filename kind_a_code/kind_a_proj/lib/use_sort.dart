import 'package:flutter/material.dart';

class DoSort extends StatefulWidget {
  const DoSort({super.key});

  @override
  State<DoSort> createState() => _DoSortState();
}

class _DoSortState extends State<DoSort> {
  bool _sortAscending = true;

  final List<Map<String, dynamic>> _products = [
    {'id': 1, 'name': 'Dragon Robot', 'price': 19.99},
    {'id': 2, 'name': 'Turtle Toy', 'price': 15.99},
    {'id': 3, 'name': 'White Board', 'price': 12.99},
    {'id': 4, 'name': 'KindaCode.com', 'price': 24.99},
    {'id': 5, 'name': 'Travel Bag', 'price': 17.99},
  ];

  void _sortProducts(bool ascending) {
    setState(() {
      _sortAscending = ascending;
      _products.sort((a, b) => ascending
          ? a['price'].toString().compareTo(b['price'].toString())
          : b['price'].toString().compareTo(a['price'].toString()));
    });
  }

  @override
  void initState() {
    super.initState();
    _sortProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERORM SORT '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_sortAscending
                      ? 'Price Low To High'
                      : 'Price High To Low'),
                  GestureDetector(
                    onTap: () => _sortProducts(!_sortAscending),
                    child: Row(
                      children: [
                        const Text('Price'),
                        Icon(_sortAscending
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //  const SizedBox(
            //     height:30,
            //   ),
            const Text('==========================================='),
            SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${_products[index]['name']}'),
                    subtitle: Text('\$${_products[index]['price'].toString()}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
