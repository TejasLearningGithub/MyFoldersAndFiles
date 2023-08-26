import 'package:flutter/material.dart';
import 'package:page_chips/content_listview_change_chips/custom_chips.dart';

class Product {
  final String name;
  final List<String> tagList;
  final int id;
  Product(this.name, this.tagList, this.id);
}

class ChipExample extends StatefulWidget {
  const ChipExample({super.key});

  @override
  State<ChipExample> createState() => _ChipExampleState();
}

class _ChipExampleState extends State<ChipExample> {
  final List<String> _allChips = [
    'Tag - 1',
    'Tag - 2',
    'Tag - 3',
    'Tag - 4',
    'Tag - 5', 
    'Tag - 6',
    'Tag - 7',
    'Tag - 8',
    'Tag - 9',
    'Tag - 10'
  ];
  final List<String> _selectedChips = [];
  final List<Product> _allProducts = [
    Product('ABC', ['Tag - 1', 'Tag - 2'], 1),
    Product('DEF', ['Tag - 2', 'Tag - 3'], 2),
    Product('GHI', ['Tag - 2', 'Tag - 4'], 3),
    Product('JKL', ['Tag - 4', 'Tag - 5'], 4),
    Product('JKL', ['Tag - 5', 'Tag - 1'], 5),
  ];

  List<Product> _getFilteredProducts() {
    return _allProducts
        .where(
          (product) => _selectedChips.every(
            (element) => product.tagList.contains(element),
          ),
        )
        .toList();
  }

  void _onChipSelected(String label, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedChips.add(label);
      } else {
        _selectedChips.remove(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chips Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < _allChips.length; i++)
                    CustomChip(
                      label: _allChips[i],
                      isSelected: _selectedChips.contains(_allChips[i]),
                      onSelected: (val) {
                        return _onChipSelected(
                          _allChips[i],
                          val,
                        );
                      },
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 450,
              child: Expanded(
                child: ListView.builder(
                    itemCount: _getFilteredProducts().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _getFilteredProducts()[index].id.toString() +
                              _getFilteredProducts()[index].name,
                        ),
                        subtitle: Text(
                            _getFilteredProducts()[index].tagList.toString()),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
