import 'package:flutter/material.dart';

class TextCaptionView extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool? isOverflow;
  final bool? isCenter;

  TextCaptionView({
    required this.text,
    this.textColor,
    this.isOverflow,
    this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: (isCenter == true) ? TextAlign.center : null,
      style: Theme.of(context).textTheme.caption?.copyWith(
          fontSize: 12,
          color: textColor ?? Colors.black,
          overflow: (isOverflow == true) ? TextOverflow.ellipsis : null),
    );
  }
}
