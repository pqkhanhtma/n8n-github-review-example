import 'package:flutter/material.dart';
import 'package:n8ndistribution/cores/constants/app_constants.dart'; // Internal import

/// A reusable and configurable text input component.
///
/// This widget provides a flexible text field that can be used for various inputs,
/// including standard text and password fields. It adheres to clean architecture
/// principles by handling all user interactions via callbacks, ensuring no
/// internal state management (`setState` or `Bloc`) within the component itself.
///
/// The password field functionality (obscuring text and toggling visibility icon)
/// is managed by the parent widget, which passes the `obscureText` boolean and
/// an appropriate `suffixIcon` (e.g., an `IconButton` with its own `onPressed` callback).
class AppTextField extends StatelessWidget {
  /// The label text displayed above the text field.
  final String labelText;

  /// The hint text displayed inside the text field when it's empty.
  final String hintText;

  /// A callback function that is called whenever the text field's content changes.
  /// It provides the current text value as a [String].
  final ValueChanged<String>? onChanged;

  /// An optional controller for the text field, allowing external control over its text.
  final TextEditingController? controller;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// An optional validator function that receives the current text value and returns
  /// an error string if the input is invalid, or `null` if it's valid.
  final String? Function(String?)? validator;

  /// The initial value to display in the text field.
  final String? initialValue;

  /// Whether the text field should obscure the text being entered.
  /// This is typically used for password fields and should be managed by the parent.
  final bool obscureText;

  /// An optional widget to display at the end of the text field (e.g., a password visibility toggle icon).
  /// The functionality of this icon (e.g., toggling `obscureText`) must be handled by the parent.
  final Widget? suffixIcon;

  /// An optional focus node for the text field, allowing external control over its focus.
  final FocusNode? focusNode;

  /// The type of action button to display on the keyboard (e.g., `done`, `next`, `send`).
  final TextInputAction? textInputAction;

  /// A callback function that is called when the user submits the text field's content
  /// (e.g., by pressing the 'done' or 'next' button on the keyboard).
  final ValueChanged<String>? onFieldSubmitted;

  /// Whether the text field is read-only. If `true`, the user cannot edit the text.
  final bool readOnly;

  /// A callback function that is called when the text field is tapped.
  final VoidCallback? onTap;

  /// The maximum number of lines the text field can display. Defaults to 1 for single-line input.
  final int? maxLines;

  /// The minimum number of lines the text field can display.
  final int? minLines;

  const AppTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.validator,
    this.initialValue,
    this.obscureText = false, // Default to false, parent manages for password fields
    this.suffixIcon,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1, // Default to single line input
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: theme.textTheme.labelLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: AppConstants.defaultLabelBottomPadding),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue,
          obscureText: obscureText,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          readOnly: readOnly,
          onTap: onTap,
          maxLines: maxLines,
          minLines: minLines,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultTextFieldContentPadding,
              vertical: AppConstants.defaultTextFieldContentPadding,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
              borderSide: BorderSide(color: colorScheme.outline, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
              borderSide: BorderSide(color: colorScheme.outline, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
              borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
              borderSide: BorderSide(color: colorScheme.error, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
              borderSide: BorderSide(color: colorScheme.error, width: 2.0),
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: colorScheme.surface,
          ),
        ),
      ],
    );
  }
}
