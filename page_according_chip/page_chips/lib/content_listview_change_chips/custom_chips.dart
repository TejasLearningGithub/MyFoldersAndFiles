import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const CustomChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(!widget.isSelected);
      },
      child: Chip(
        label: Text(widget.label),
        backgroundColor: widget.isSelected ? Colors.cyan : Colors.grey,
        labelStyle:
            TextStyle(color: widget.isSelected ? Colors.amber : Colors.white),
      ),
    );
  }
}
