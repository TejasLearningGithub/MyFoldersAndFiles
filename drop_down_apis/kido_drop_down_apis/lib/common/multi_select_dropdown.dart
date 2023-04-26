import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/common/app_theme.dart';

class MultiSelectDropDown extends StatefulWidget {
  const MultiSelectDropDown({
    super.key,
    required this.itemList,
    required this.isRequired,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    this.dropDownKey,
    required this.initialItems,
    this.autoValidate = AutovalidateMode.onUserInteraction,
  });
  final List<String> initialItems;
  final GlobalKey<FormFieldState>? dropDownKey;
  final ValueChanged<List<String>> onChange;
  final String labelText;
  final String hintText;
  final bool isRequired;
  final List<String> itemList;
  final AutovalidateMode autoValidate;
  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.labelText,
                style: montserratNormal.copyWith(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              widget.isRequired
                  ? const Text(
                      ' *',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                      ),
                    )
                  : Container(),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          DropdownSearch.multiSelection(
            selectedItems: widget.initialItems,
            autoValidateMode: widget.autoValidate,
            validator: (List<String>? list) {
              if (widget.isRequired) {
                if (list!.isEmpty) {
                  return "Required field";
                }
                return null;
              }
              return null;
            },
            key: widget.dropDownKey,
            items: widget.itemList,
            dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 11,
                ),
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                    ),
              ),
            ),
            onChanged: (list) {
              widget.onChange(list);
            },
          ),
        ],
      ),
    );
  }
}
