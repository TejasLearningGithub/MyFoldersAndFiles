import 'package:flutter/material.dart';
import 'package:page_chips/ex_chat_gpt/product_provider.dart';
import 'package:provider/provider.dart';

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final isSelected = productsProvider.selectedChip == label;

    return GestureDetector(
      onTap: () {
        productsProvider.selectChip(isSelected ? null : label);
      },
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
