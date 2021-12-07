import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/add_literacy_controller.dart';

class AddLiteracyView extends GetView<AddLiteracyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Literasi'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            controller.addLiteracyToDatabase();
          },
          icon: FaIcon(FontAwesomeIcons.plusCircle),
          label: Text("Tambah data ke firestore"),
        ),
      ),
    );
  }
}
