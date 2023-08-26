import 'package:flutter/material.dart';
import 'package:page_chips/content_listview_change_chips/custom_chips.dart';

class Product {
  final String name;
  final List<String> tags;

  Product({required this.name, required this.tags});
}

class ChipExampleListViewWidget extends StatefulWidget {
  const ChipExampleListViewWidget({super.key});

  @override
  _ChipExampleListViewWidgetState createState() =>
      _ChipExampleListViewWidgetState();
}

class _ChipExampleListViewWidgetState extends State<ChipExampleListViewWidget> {
  final List<String> _allChips = ['Tag 1', 'Tag 2', 'Tag 3', 'Tag 4', 'Tag 5'];
  final List<String> _selectedChips = [];
  final List<Product> _allProducts = [
    Product(name: 'Product 1', tags: ['Tag 1', 'Tag 2']),
    Product(name: 'Product 2', tags: ['Tag 2', 'Tag 3']),
    Product(name: 'Product 3', tags: ['Tag 1', 'Tag 3']),
    Product(name: 'Product 4', tags: ['Tag 2', 'Tag 4']),
    Product(name: 'Product 5', tags: ['Tag 4', 'Tag 5']),
    // Add more products with their respective tags
  ];

  void _onChipSelected(String label, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedChips.add(label);
      } else {
        _selectedChips.remove(label);
      }
    });
  }

  List<Product> _getFilteredProducts() {
    return _allProducts
        .where((product) =>
            _selectedChips.every((chip) => product.tags.contains(chip)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chips Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              children: _allChips.map((chip) {
                return CustomChip(
                  label: chip,
                  isSelected: _selectedChips.contains(chip),
                  onSelected: (isSelected) => _onChipSelected(chip, isSelected),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getFilteredProducts().length,
              itemBuilder: (context, index) {
                final product = _getFilteredProducts()[index];
                return ListTile(
                  // title: Text(product.name),
                  title: Text(product.name),
                  subtitle: Text(product.tags.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
