import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_chips/widget/chip_widget.dart';

class ChipExampleWidget extends StatefulWidget {
  const ChipExampleWidget({super.key});

  @override
  _ChipExampleWidgetState createState() => _ChipExampleWidgetState();
}

class _ChipExampleWidgetState extends State<ChipExampleWidget> {
  final List<String> _selectedChips = [];
  var chipString = 'A';
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
      appBar: AppBar(title: const Text('Chips Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              children: [
                ChipWidget(
                  label: 'Tag 1',
                  isSelected: _selectedChips.contains('Tag 1'),
                  onSelected: (isSelected) =>
                      _onChipSelected('Tag 1', isSelected),
                ),
                ChipWidget(
                  label: 'Tag 2',
                  isSelected: _selectedChips.contains('Tag 2'),
                  onSelected: (isSelected) =>
                      _onChipSelected('Tag 2', isSelected),
                ),
                ChipWidget(
                  label: 'Tag 3',
                  isSelected: _selectedChips.contains('Tag 3'),
                  onSelected: (isSelected) =>
                      _onChipSelected('Tag 3', isSelected),
                ),
                // Add more custom chips as needed
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Selected Chips: $chipString'),
          ),
        ],
      ),
    );
  }

  String chipFunction() {
    if (_selectedChips == 0) {
      setState(() {
        chipString = 'First Selected';
      });
    }
    log(_selectedChips.toString());
    return chipString;
  }
}
