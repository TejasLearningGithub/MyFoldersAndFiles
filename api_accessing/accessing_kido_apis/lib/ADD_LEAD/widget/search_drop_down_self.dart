import 'package:accessing_kido_apis/ADD_LEAD/self_Experiment/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySearchDropdownSelf extends StatefulWidget {
  final GlobalKey<FormFieldState>? dropDownKey;
  final String? labelText;
  final String hintText;
  final bool isRequired;
  final ValueChanged<MenuItem> onChanged;
  final List<MenuItem> items;
  final double? dropdownWidth;
  final String? initValue;

  const MySearchDropdownSelf({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.dropDownKey,
    this.dropdownWidth,
    this.labelText,
    this.initValue,
    this.isRequired = false,
  });

  @override
  State<MySearchDropdownSelf> createState() => _MySearchDropdownSelfState();
}

class _MySearchDropdownSelfState extends State<MySearchDropdownSelf> {
  TextEditingController controller = TextEditingController();
  TextEditingController? searchController;

  List<MenuItem> suggestionItems = [];
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16 / 2,
        horizontal: 16,
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
                    fontSize: 15,
                  ),
                ),
                widget.isRequired ? Text(' *') : const SizedBox.shrink()
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
                      return 'Required Field  ';
                    } else {
                      return null;
                    }
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
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(onDismiss: () {
            _removeOverlay();
          }),
          Positioned(
            width: widget.dropdownWidth ??
                widget.dropdownWidth ??
                MediaQuery.of(context).size.width - 56,
            height: 350,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 4,
                color: Colors.white,
                child: Column(
                  children: [
                    TextField(
                      enabled: widget.items.isNotEmpty,
                      controller: searchController,
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
                                  .where((element) => element.display
                                      .toLowerCase()
                                      .contains(value.text.toLowerCase()))
                                  .toList();
                          return ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 300),
                            child: suggestionItems.isEmpty
                                ? const ListTile(
                                    title: Text('No Result Found'),
                                  )
                                : ListView.builder(
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
                    )
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
    _overlayEntry!.remove();
    _overlayEntry = null;
    searchController!.dispose();
    searchController = null;
  }

  void dispose() {
    controller.dispose();
    searchController?.dispose();
  }
}
