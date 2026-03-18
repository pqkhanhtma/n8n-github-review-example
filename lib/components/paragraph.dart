import 'package:flutter/material.dart';

/// A reusable UI component for displaying a paragraph of text.
///
/// This widget allows for flexible configuration of text content and styling,
/// adhering to clean architecture principles by handling all interactions
/// (though none are typically needed for a static paragraph) via parameters.
class Paragraph extends StatelessWidget {
  /// The text content to display in the paragraph.
  final String text;

  /// The style to apply to the text. If null, the default text style from the theme will be used.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The maximum number of lines for the text to span. If null, there is no limit.
  final int? maxLines;

  /// How visual overflow should be handled. If null, the default behavior is to clip.
  final TextOverflow? overflow;

  /// Creates a [Paragraph] widget.
  ///
  /// The [text] parameter is required and specifies the content of the paragraph.
  /// [style], [textAlign], [maxLines], and [overflow] are optional parameters
  /// to customize the appearance and behavior of the text.
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
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
