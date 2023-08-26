import 'package:accessing_kido_apis/ADD_LEAD/self_Experiment/menu_item.dart';
import 'package:flutter/material.dart';

class SearchDropDown extends StatefulWidget {
  const SearchDropDown({
    super.key,
    this.labelText,
    required this.hintText,
    this.isRequired = false,
    required this.onChanged,
    required this.items,
    this.dropDownKey,
    this.dropdownWidth,
    this.initValue,
  });

  final GlobalKey<FormFieldState>? dropDownKey;
  final String? labelText;
  final String hintText;
  final bool isRequired;
  final ValueChanged<MenuItem> onChanged;
  final List<MenuItem> items;
  final double? dropdownWidth;
  final String? initValue;

  @override
  State<SearchDropDown> createState() => _SearchDropDownState();
}

class _SearchDropDownState extends State<SearchDropDown> {
  TextEditingController controller = TextEditingController();
  TextEditingController? searchController;

  List<MenuItem> suggestionItems = [];
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    if (widget.initValue != null) {
      controller.text = widget.items
          .firstWhere((element) => element.value == widget.initValue)
          .display;
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            onDismiss: () {
              _removeOverlay();
            },
          ),
          Positioned(
            width:
                widget.dropdownWidth ?? MediaQuery.of(context).size.width - 56,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      enabled: widget.items.isNotEmpty,
                      controller: searchController!,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 11,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: ValueListenableBuilder(
                        valueListenable: searchController!,
                        builder: (context, value, _) {
                          suggestionItems = value.text.isEmpty
                              ? [...widget.items]
                              : widget.items
                                  .where(
                                    (element) => element.display
                                        .toLowerCase()
                                        .contains(value.text.toLowerCase()),
                                  )
                                  .toList();
                          return ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 300),
                            child: suggestionItems.isEmpty
                                ? const ListTile(
                                    title: Text('No Results Found'),
                                  )
                                : ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: suggestionItems.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () async {
                                          controller.text =
                                              suggestionItems[index].display;
                                          _removeOverlay();
                                          FocusScope.of(context).unfocus();
                                          widget.onChanged(
                                              suggestionItems[index]);
                                        },
                                        title: Text(
                                            suggestionItems[index].display),
                                      );
                                    },
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    searchController?.dispose();
    searchController = null;
  }

  @override
  void dispose() {
    controller.dispose();
    searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          //vertical: defaultPadding / 2,
          //horizontal: defaultPadding,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.labelText!,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                widget.isRequired
                    ? Text(
                        ' *',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 13,
                              color: Colors.red,
                            ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          if (widget.labelText != null)
            const SizedBox(
              height: 2,
            ),
          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onPanDown: (details) {
                if (_overlayEntry == null) {
                  searchController = TextEditingController();
                  _overlayEntry = _createOverlayEntry();
                  Overlay.of(context).insert(_overlayEntry!);
                } else {
                  _removeOverlay();
                }
              },
              child: TextFormField(
                key: widget.dropDownKey,
                controller: controller,
                readOnly: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (widget.isRequired) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  hintText: widget.hintText,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 11,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

