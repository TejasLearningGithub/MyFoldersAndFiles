import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/theme/theme_constant.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText,
    required this.isRequired,
    required this.hintText,
    this.extraChild = const SizedBox.shrink(),
    this.onTap,
    this.readOnly = false,
    this.keyBoardType,
    this.max,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.headerWidget,
    this.style,
  });
  final TextStyle? style;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget extraChild;
  final TextEditingController controller;
  final String? labelText;
  final String hintText;
  final bool isRequired;
  final TextInputType? keyBoardType;
  final int? max;
  final Widget? headerWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (headerWidget != null) headerWidget!,
          if (labelText != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  )
                ),
                            ],
            ),
          if (labelText != null) const SizedBox(height: 2),
          TextFormField(
            cursorColor: AppColors.darkBlue,
            readOnly: readOnly,
            onTap: onTap,
            controller: controller,
            onChanged: onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyBoardType,
            validator: (value) {
              if (isRequired) {
                if (value!.isEmpty) {
                  return 'This field can\'t be empty!';
                }
                return null;
              }
              return null;
            },
            style: style ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(max),
            //   if (max != null) FilteringTextInputFormatter.digitsOnly
            // ],
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintMaxLines: minLines,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 11,
              ),
            ),
          ),
          extraChild,
        ],
      ),
    );
  }
}
