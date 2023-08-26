import 'package:flutter/material.dart';
import 'package:prg_fantasy/flutter_clutter_textformfield_text/models/text_part_style_definition.dart';
import 'package:prg_fantasy/flutter_clutter_textformfield_text/stylable_text_field_controller.dart';

import 'models/text_part_style_definitions.dart';

class HomePageTextFormFieldController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        StyleableTextFieldController(
      styles: TextPartStyleDefinitions(
        definitionList: <TextPartStyleDefinition>[
          TextPartStyleDefinition(
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            pattern: '[\.,\?\!]',
          ),
          TextPartStyleDefinition(
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            pattern: '(?:(the|a|an) +)',
          ),
        ],
      ),
    );

    return Scaffold(
      body: Center(
        child: TextField(
          controller: textEditingController,
          autocorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.none,
        ),
      ),
    );
  }
}