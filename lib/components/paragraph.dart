import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A data model to represent a segment of text within the Paragraph component.
/// This allows for different styles and optional tap handlers for specific parts of the text.
class ParagraphSegment {
  /// The text content for this segment.
  final String text;

  /// The style to apply to this text segment. If null, the default style
  /// (or inherited style) will be used.
  final TextStyle? style;

  /// An optional callback that is invoked when this text segment is tapped.
  /// If null, the segment is not tappable.
  final VoidCallback? onTap;

  /// Creates a [ParagraphSegment].
  const ParagraphSegment({
    required this.text,
    this.style,
    this.onTap,
  });
}

/// A highly flexible and configurable UI component for displaying rich text paragraphs.
///
/// This component allows for displaying text with mixed styles and optional
/// tappable segments, adhering to clean architecture principles by handling
/// all interactions via callbacks. It is a [StatelessWidget] and does not
/// manage its own state.
///
/// Example usage:
/// dart
/// Paragraph(
///   segments: [
///     ParagraphSegment(text: "Don't have an account? "),
///     ParagraphSegment(
///       text: "SIGN UP",
///       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
///       onTap: () {
///         print("SIGN UP tapped!");
///         // Handle navigation or other action
///       },
///     ),
///     ParagraphSegment(text: " using your email address or social media below"),
///   ],
///   textAlign: TextAlign.center,
/// )
/// 
class Paragraph extends StatelessWidget {
  /// A list of [ParagraphSegment]s that define the content, style, and
  /// interactivity of different parts of the paragraph.
  final List<ParagraphSegment> segments;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This is used to resolve the [textAlign] and [textDirection] properties.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there is unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// An optional maximum number of lines for the text to span.
  ///
  /// If the text exceeds the given number of lines, it will be truncated
  /// according to [overflow].
  final int? maxLines;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, then 14pt text will be
  /// rendered as if it were 21pt text.
  final double? textScaleFactor;

  /// The strut style to use. Strut style defines the minimum height a line
  /// should occupy.
  final StrutStyle? strutStyle;

  /// The locale used to select a font when the font family is a list of font
  /// families.
  final Locale? locale;

  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text.
  final String? semanticsLabel;

  /// The strategy to use when measuring the width of the text.
  final TextWidthBasis? textWidthBasis;

  /// How the vertical space around the text should be handled.
  final TextHeightBehavior? textHeightBehavior;

  /// Creates a [Paragraph] component.
  const Paragraph({
    Key? key,
    required this.segments,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.textScaleFactor,
    this.strutStyle,
    this.locale,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }

    // Determine the default text style from the current theme.
    // This ensures consistency with the app's overall typography.
    final TextStyle defaultTextStyle = Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      textScaleFactor: textScaleFactor,
      strutStyle: strutStyle,
      locale: locale,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      text: TextSpan(
        children: segments.map((segment) {
          // Merge the segment's style with the default style to ensure
          // any unspecified properties inherit from the theme.
          final TextStyle effectiveStyle = defaultTextStyle.merge(segment.style);
          return TextSpan(
            text: segment.text,
            style: effectiveStyle,
            // Attach a TapGestureRecognizer if an onTap callback is provided,
            // making the segment interactive.
            recognizer: segment.onTap != null
                ? (TapGestureRecognizer()..onTap = segment.onTap)
                : null,
          );
        }).toList(),
      ),
    );
  }
}
