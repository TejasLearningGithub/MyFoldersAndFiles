import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const ChipWidget({super.key, 
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.label),
      selected: widget.isSelected,
      onSelected: widget.onSelected,
    );
  }
}
