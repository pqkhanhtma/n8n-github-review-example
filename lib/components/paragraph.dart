import 'package:flutter/material.dart';

/// A reusable atomic component for rendering paragraph text.
/// 
/// This component supports both simple strings and complex rich text using [InlineSpan].
/// It follows Flutter 3.29.0 standards by using [bodyMedium] as the default text style.
class Paragraph extends StatelessWidget {
  /// The plain text content of the paragraph.
  final String? text;

  /// A list of [InlineSpan] for rich text formatting (e.g., bolding specific words like "SIGN UP").
  final List<InlineSpan>? spans;

  /// Custom [TextStyle] to override the default theme-based style.
  final TextStyle? style;

  /// How the text should be aligned horizontally. Defaults to [TextAlign.center].
  final TextAlign textAlign;

  /// The maximum number of lines for the text to span.
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The line height multiplier.
  final double? height;

  const Paragraph({
    super.key,
    this.text,
    this.spans,
    this.style,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.overflow,
    this.height,
  }) : assert(text != null || spans != null, 'Either text or spans must be provided');

  @override
  Widget build(BuildContext context) {
    // Using bodyMedium as per Flutter 3.29.0 naming conventions (replaces bodyText2)
    final TextStyle baseStyle = Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
    
    final TextStyle effectiveStyle = baseStyle.merge(style).copyWith(
          height: height,
        );

    if (spans != null) {
      return Text.rich(
        TextSpan(
          text: text,
          children: spans,
        ),
        style: effectiveStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    return Text(
      text ?? '',
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
