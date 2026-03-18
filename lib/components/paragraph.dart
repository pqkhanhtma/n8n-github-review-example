import 'package:flutter/material.dart';

/// A reusable Flutter UI component for displaying a paragraph of text.
///
/// This widget allows for flexible configuration of text content and styling.
/// It adheres to clean architecture principles by being a `StatelessWidget`
/// and managing all its properties via constructor parameters.
///
/// Example usage:
/// dart
/// Paragraph(
///   text: 'This is a sample paragraph of text that demonstrates the capabilities of the Paragraph component.',
///   style: TextStyle(
///     fontSize: 16.0,
///     color: Colors.blueGrey[800],
///     height: 1.5,
///   ),
///   textAlign: TextAlign.justify,
///   maxLines: 3,
///   overflow: TextOverflow.ellipsis,
/// )
/// 
class Paragraph extends StatelessWidget {
  /// The text content to be displayed in the paragraph.
  final String text;

  /// Optional [TextStyle] to apply to the paragraph text.
  /// If provided, it will be merged with the default body text style from the current theme.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The maximum number of lines for the text to span.
  /// If the text exceeds this number, it will be truncated based on [overflow].
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Creates a [Paragraph] widget.
  const Paragraph({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    // Retrieve the default body text style from the current theme.
    // This ensures consistency with the application's overall typography.
    final TextStyle defaultStyle = Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

    return Text(
      text,
      // Merge the provided style with the default style.
      // Properties in 'style' will override those in 'defaultStyle'.
      style: defaultStyle.merge(style),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
