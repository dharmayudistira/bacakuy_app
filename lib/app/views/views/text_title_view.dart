import 'package:flutter/material.dart';

class TextTitleView extends StatelessWidget {
  final String text;
  final Color? textColor;

  TextTitleView({required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: textColor ?? Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
    );
  }
}
