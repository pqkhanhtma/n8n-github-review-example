import 'package:flutter/material.dart';

// These constants are defined internally for demonstration purposes.
// In a real project, they would be imported from a central constants file
// like 'package:n8ndistribution/cores/constants/app_colors.dart'
// and 'package:n8ndistribution/cores/constants/app_dimensions.dart'.
const double _kDefaultBorderRadius = 8.0;
const double _kDefaultContentPaddingHorizontal = 16.0;
const double _kDefaultContentPaddingVertical = 12.0;
const Color _kDefaultBorderColor = Colors.grey;
const Color _kFocusedBorderColor = Colors.blue;
const Color _kErrorBorderColor = Colors.red;
const Color _kHintTextColor = Colors.grey;
const Color _kLabelTextColor = Colors.black;
const Color _kIconColor = Colors.grey;

/// A highly configurable and reusable text input field component.
///
/// This component supports both standard text input and password input fields.
/// For password fields, it includes a visibility toggle icon.
/// All user interactions, such as text changes and password visibility toggles,
/// are handled via callbacks to maintain strict separation of concerns.
class AppTextField extends StatelessWidget {
  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The initial value of the text field. Only used if [controller] is null.
  final String? initialValue;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that describes the input field.
  final String? labelText;

  /// If true, the field behaves as a password field with a visibility toggle icon.
  final bool isPasswordField;

  /// Whether the text is obscured. This must be managed by the parent widget
  /// when [isPasswordField] is true.
  final bool obscureText;

  /// Callback invoked when the password visibility icon is pressed.
  /// This is mandatory when [isPasswordField] is true.
  final VoidCallback? onToggleVisibility;

  /// Called when the text being edited changes.
  final ValueChanged<String>? onChanged;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// A function that validates the input. Returns an error string or null.
  final String? Function(String?)? validator;

  /// If true, the text field is read-only.
  final bool readOnly;

  /// If false, the text field is disabled.
  final bool enabled;

  /// The maximum number of lines for the text field to occupy.
  final int? maxLines;

  /// The minimum number of lines for the text field to occupy.
  final int? minLines;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// An optional focus node to control the focus of the text field.
  final FocusNode? focusNode;

  /// If true, the text field will be focused automatically when the widget is built.
  final bool autofocus;

  /// An icon that appears before the text field's input area.
  final Widget? prefixIcon;

  /// An icon that appears after the text field's input area.
  /// If [isPasswordField] is true, this will be overridden by the visibility toggle icon.
  final Widget? suffixIcon;

  /// The padding for the input decoration's content.
  final EdgeInsetsGeometry? contentPadding;

  /// The color to fill the input decoration's container with.
  final Color? fillColor;

  /// If true, the decoration's container is filled with [fillColor].
  final bool filled;

  /// The border to display around the input decorator's container.
  final InputBorder? border;

  /// The border to display when the input decorator is enabled and not in an error state.
  final InputBorder? enabledBorder;

  /// The border to display when the input decorator is focused.
  final InputBorder? focusedBorder;

  /// The border to display when the input decorator is in an error state.
  final InputBorder? errorBorder;

  /// The style to use for the hint text.
  final TextStyle? hintStyle;

  /// The style to use for the label text.
  final TextStyle? labelStyle;

  /// The style to use for the input text.
  final TextStyle? textStyle;

  const AppTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.isPasswordField = false,
    this.obscureText = false,
    this.onToggleVisibility,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.fillColor,
    this.filled = false,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
  }) : assert(
          !isPasswordField || (isPasswordField && onToggleVisibility != null),
          'onToggleVisibility must be provided when isPasswordField is true.',
        );

  @override
  Widget build(BuildContext context) {
    // Default border styles for consistency
    final defaultOutlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kDefaultBorderRadius),
      borderSide: const BorderSide(color: _kDefaultBorderColor),
    );

    final focusedOutlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kDefaultBorderRadius),
      borderSide: const BorderSide(color: _kFocusedBorderColor, width: 2.0),
    );

    final errorOutlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kDefaultBorderRadius),
      borderSide: const BorderSide(color: _kErrorBorderColor, width: 2.0),
    );

    Widget? effectiveSuffixIcon;
    if (isPasswordField) {
      // If it's a password field, the suffix icon is the visibility toggle.
      // The onToggleVisibility callback is mandatory in this case (enforced by assert).
      effectiveSuffixIcon = IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: _kIconColor,
        ),
        onPressed: onToggleVisibility, // Callback to parent to manage obscureText state
      );
    } else {
      // If not a password field, use the provided custom suffixIcon.
      effectiveSuffixIcon = suffixIcon;
    }

    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null, // Use initialValue only if no controller is provided
      obscureText: isPasswordField ? obscureText : false, // Apply obscurity only if it's a password field and obscureText is true
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      focusNode: focusNode,
      autofocus: autofocus,
      style: textStyle, // Apply custom text style
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? const TextStyle(color: _kHintTextColor),
        labelStyle: labelStyle ?? const TextStyle(color: _kLabelTextColor),
        prefixIcon: prefixIcon,
        suffixIcon: effectiveSuffixIcon,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: _kDefaultContentPaddingHorizontal,
              vertical: _kDefaultContentPaddingVertical,
            ),
        fillColor: fillColor,
        filled: filled,
        // Apply custom borders or fall back to defaults
        border: border ?? defaultOutlineInputBorder,
        enabledBorder: enabledBorder ?? defaultOutlineInputBorder,
        focusedBorder: focusedBorder ?? focusedOutlineInputBorder,
        errorBorder: errorBorder ?? errorOutlineInputBorder,
        focusedErrorBorder: errorBorder ?? errorOutlineInputBorder, // Also apply error border when focused and in error state
      ),
    );
  }
}
