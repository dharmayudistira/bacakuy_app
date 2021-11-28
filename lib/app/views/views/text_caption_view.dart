import 'package:flutter/material.dart';

class TextCaptionView extends StatelessWidget {
  final String text;
  final Color? textColor;

  TextCaptionView({required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .caption
          ?.copyWith(color: textColor ?? Colors.black),
    );
  }
}
