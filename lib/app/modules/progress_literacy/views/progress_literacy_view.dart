import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/progress_literacy_controller.dart';

class ProgressLiterasiView extends GetView<ProgressLiterasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProgressLiterasiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProgressLiterasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
