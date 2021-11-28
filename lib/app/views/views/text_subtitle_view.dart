import 'package:flutter/material.dart';

class TextSubtitleView extends StatelessWidget {
  final String text;

  TextSubtitleView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
