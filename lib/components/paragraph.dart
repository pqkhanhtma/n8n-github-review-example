import 'package:flutter/material.dart';

/// A reusable paragraph component for displaying text with flexible styling.
/// 
/// This component supports both simple strings and rich text spans to handle
/// cases where specific parts of the text need different formatting (e.g., bolding).
class Paragraph extends StatelessWidget {
  /// The plain text content of the paragraph.
  final String? text;

  /// Optional list of [InlineSpan] for complex formatted text.
  final List<InlineSpan>? spans;

  /// The base text style for the paragraph.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
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
    this.height = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    // Use modern TextTheme naming convention (bodyMedium instead of bodyText2)
    final TextStyle defaultStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: height,
              // Using withValues(alpha:) instead of deprecated withOpacity()
              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
            ) ??
        const TextStyle(height: 1.5);

    final TextStyle effectiveStyle = defaultStyle.merge(style);

    if (spans != null) {
      return Text.rich(
        TextSpan(
          children: spans,
          style: effectiveStyle,
        ),
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
