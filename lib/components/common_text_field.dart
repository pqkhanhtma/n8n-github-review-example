import 'package:flutter/material.dart';

/// A highly configurable text input component following atomic design principles.
class CommonTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool obscureText;
  final Widget? prefixIcon;
  final VoidCallback? onToggleVisibility;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;

  const CommonTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.prefixIcon,
    this.onToggleVisibility,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.backgroundColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor);
    final TextStyle? hintStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: hintColor ?? Theme.of(context).hintColor.withValues(alpha: 0.6),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: isPassword ? obscureText : false,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: textStyle,
          cursorColor: textColor ?? Theme.of(context).primaryColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            prefixIcon: prefixIcon != null
                ? IconTheme(
                    data: IconThemeData(
                      color: iconColor ?? Colors.white,
                      size: 20,
                    ),
                    child: prefixIcon!,
                  )
                : null,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      size: 22,
                      color: iconColor ?? Colors.white.withValues(alpha: 0.7),
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            filled: true,
            fillColor: backgroundColor ?? const Color(0xFFF8F8F8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
