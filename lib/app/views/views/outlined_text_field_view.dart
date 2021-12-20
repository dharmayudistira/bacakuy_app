import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OutlinedTextFieldView extends StatelessWidget {
  final String label;
  final bool? isNumber;
  final TextEditingController textController;
  final String? initValue;

  OutlinedTextFieldView({
    required this.label,
    required this.textController,
    this.isNumber,
    this.initValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
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
