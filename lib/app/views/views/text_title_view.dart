import 'package:flutter/material.dart';

class TextTitleView extends StatelessWidget {
  final String text;

  TextTitleView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
