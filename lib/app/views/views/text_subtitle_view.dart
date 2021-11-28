import 'package:flutter/material.dart';

class TextSubtitleView extends StatelessWidget {
  final String text;
  final Color? textColor;

  TextSubtitleView({required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(color: textColor ?? Colors.black),
    );
  }
}
