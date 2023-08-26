import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  const CustomChip(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onSelected});
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.isSelected);
      },
      child: Chip(
        label: Text(widget.label),
        backgroundColor: widget.isSelected ? Colors.green : Colors.purple,
        labelStyle: TextStyle(
          color: widget.isSelected ? Colors.white : Colors.cyan,
        ),
      ),
    );
  }
}
