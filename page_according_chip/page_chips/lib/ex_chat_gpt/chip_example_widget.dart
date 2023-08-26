import 'package:flutter/material.dart';
import 'package:page_chips/ex_chat_gpt/product_provider.dart';
import 'package:provider/provider.dart';

import 'custom_chip.dart';

class MyChipExampleWidget extends StatelessWidget {
  const MyChipExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(
      context,
      //listen: false,
    );
    final filteredProducts = productsProvider.getFilteredProducts();
    final List<String> allChips = [
      'Tag 1',
      'Tag 2',
      'Tag 3',
      'Tag 4',
      'Tag 5',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Chips Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              children:
                  allChips.map((chip) => CustomChip(label: chip)).toList(),
            ),
          ),
          Selector<ProductsProvider, List<Product>>(selector: (p0, p1) {
            return p1.allProducts;
          }, builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ListTile(
                    title: Text(value[index].name),
                    trailing: Text(product.tags.toString()),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
