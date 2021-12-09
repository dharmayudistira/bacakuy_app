import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OutlinedTextFieldView extends StatelessWidget {
  final String label;
  final bool? isNumber;
  final TextEditingController textController;

  OutlinedTextFieldView({
    required this.label,
    required this.textController,
    this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType:
          (isNumber == true) ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
