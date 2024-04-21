import 'package:flutter/gestures.dart';
import 'package:traqa/core/core.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.fontSize = kfsTiny,
    this.textColor = kBlack,
    this.fontWeight = w400,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height,
    this.fontFamily,
    this.onTap,
    this.fontStyle,
    this.isShantell = false,
  });

  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final double? height;
  final String? fontFamily;
  final VoidCallback? onTap;
  final bool isShantell;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: sp(fontSize!),
          fontFamily:
              fontFamily ?? (isShantell ? 'Shantell Sans' : 'Avenir Next'),
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          decoration: decoration,
          height: height,
        ),
        textAlign: textAlign,
        overflow: overflow,
        softWrap: true,
        maxLines: maxLines,
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.text,
    required this.text2,
    this.fontSize = kfsTiny,
    this.fontSize2 = kfsTiny,
    this.textColor = kBlack,
    this.textColor2 = kBlack,
    this.textColor3,
    this.fontWeight = w400,
    this.fontWeight2 = w400,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow,
    this.decoration2 = TextDecoration.none,
    this.decoration4 = TextDecoration.none,
    this.fontFamily,
    this.onTap,
    this.onTap1,
    this.text3,
    this.text4,
    this.isShantell = false,
  });

  final String text;
  final String text2;
  final String? text3;
  final String? text4;
  final double? fontSize;
  final double? fontSize2;
  final Color? textColor;
  final String? fontFamily;
  final Color? textColor2;
  final Color? textColor3;
  final FontWeight? fontWeight;
  final FontWeight? fontWeight2;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration2;
  final TextDecoration? decoration4;
  final GestureRecognizer? onTap;
  final GestureRecognizer? onTap1;
  final bool isShantell;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: textAlign,
      maxLines: maxLines,
      TextSpan(
        text: text,
        style: TextStyle(
          fontSize: sp(fontSize!),
          color: textColor,
          fontWeight: fontWeight,
          fontFamily:
              fontFamily ?? (isShantell ? 'Shantell Sans' : 'Avenir Next'),
          overflow: overflow,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: text2,
            recognizer: onTap,
            style: TextStyle(
              fontSize: sp(fontSize2!),
              color: textColor2,
              fontFamily:
                  fontFamily ?? (isShantell ? 'Shantell Sans' : 'Avenir Next'),
              fontWeight: fontWeight2,
              decoration: decoration2,
            ),
          ),
          TextSpan(
            text: text3,
            style: TextStyle(
              fontSize: sp(fontSize!),
              color: textColor3,
              fontFamily:
                  fontFamily ?? (isShantell ? 'Shantell Sans' : 'Avenir Next'),
              fontWeight: fontWeight,
            ),
          ),
          TextSpan(
            text: text4,
            recognizer: onTap1,
            style: TextStyle(
              fontSize: sp(fontSize2!),
              color: textColor2,
              fontFamily:
                  fontFamily ?? (isShantell ? 'Shantell Sans' : 'Poppins'),
              fontWeight: fontWeight2,
              decoration: decoration4,
            ),
          ),
        ],
      ),
    );
  }
}
