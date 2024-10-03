import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';

const double _kSearchBorderRadius = 24.0;
const double _kPadding = 8.0;

class BfSearchWidget extends StatelessWidget {
  const BfSearchWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.onPressedClear,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final VoidCallback? onPressedClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_kPadding),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: TranslationKey.search.name.tr,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_kSearchBorderRadius),
          ),
          filled: true,
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          // Clear button
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: onPressedClear,
          ),
        ),
      ),
    );
  }
}
