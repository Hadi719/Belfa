import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization/translation/translation_keys.dart';
import 'belfa_app_bar.dart';

const double _kFormHorizontalPadding = 8.0;
const double _kFormVerticalPadding = 16.0;
const double _kAfterTextFormFieldPadding = 24.0;
const double _kTextFormFieldBorderRadius = 16.0;
const double _kTextFormFieldBorderWidth = 3.0;
const double _kBeforeFormButtonsPadding = 32.0;
const double _kFormButtonsPadding = 16.0;
const double _kAfterFormButtonsPadding = 16.0;

class BfFormScreen extends StatelessWidget {
  const BfFormScreen({
    super.key,
    required this.formKey,
    this.appBarTitle = '',
    this.bfTextFormFields,
    this.otherWidget,
    required this.bfFormButtons,
  });

  final GlobalKey<FormState> formKey;
  final String appBarTitle;
  final List<BfTextFormField>? bfTextFormFields;
  final List<Widget>? otherWidget;
  final BfFormButtons bfFormButtons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: belfaAppBar(appBarTitle: appBarTitle),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: _kFormHorizontalPadding,
          vertical: _kFormVerticalPadding,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              if (bfTextFormFields != null) ...bfTextFormFields!,
              if (otherWidget != null) ...otherWidget!,
              bfFormButtons,
            ],
          ),
        ),
      ),
    );
  }
}

class BfTextFormField extends StatelessWidget {
  const BfTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.labelText,
    this.validator,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_kTextFormFieldBorderRadius),
              borderSide: const BorderSide(
                // color: Colors.grey,
                width: _kTextFormFieldBorderWidth,
              ),
              // gapPadding: _kTextFormFieldBorderGapPadding,
            ),
          ),
          validator: validator,
        ),
        const SizedBox(height: _kAfterTextFormFieldPadding),
      ],
    );
  }
}

class BfFormButtons extends StatelessWidget {
  const BfFormButtons({
    super.key,
    this.isDeleteButtonVisible = false,
    this.onPressedSaved,
    this.onConfirmDelete,
    this.confirmDeleteObjectText = '',
  });

  final VoidCallback? onPressedSaved;
  final VoidCallback? onConfirmDelete;
  final bool isDeleteButtonVisible;
  final String confirmDeleteObjectText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: _kBeforeFormButtonsPadding),
        // Save button
        ElevatedButton(
          onPressed: onPressedSaved,
          child: Text(TranslationKey.save.name.tr),
        ),
        const SizedBox(height: _kFormButtonsPadding),
        // Cancel button
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(TranslationKey.cancel.name.tr),
        ),
        const SizedBox(height: _kFormButtonsPadding),
        // Delete button if is visible
        if (isDeleteButtonVisible)
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: TranslationKey.delete.name.tr,
                middleText:
                    '${TranslationKey.confirm.name.tr} ${TranslationKey.delete.name.tr} $confirmDeleteObjectText?',
                onConfirm: onConfirmDelete,
                textConfirm: TranslationKey.confirm.name.tr,
                textCancel: TranslationKey.cancel.name.tr,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Get.theme.colorScheme.error,
              foregroundColor: Get.theme.colorScheme.onError,
              elevation: 8.0,
            ),
            child: Text(TranslationKey.delete.name.tr),
          ),
        const SizedBox(height: _kAfterFormButtonsPadding),
      ],
    );
  }
}
