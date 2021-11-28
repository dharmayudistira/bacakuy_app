import 'package:flutter/material.dart';

class TextCaptionView extends StatelessWidget {
  final String text;

  TextCaptionView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
