import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:bacakuy_app/app/views/views/outlined_text_field_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/add_literacy_controller.dart';

class AddLiteracyView extends GetView<AddLiteracyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Literasi',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(dimenMedium),
          child: Column(
            children: [
              OutlinedTextFieldView(
                textController: controller.bookTitleController,
                label: "Judul buku",
              ),
              SizedBox(height: dimenMedium),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: OutlinedTextFieldView(
                      textController: controller.targetController,
                      label: "Target / Tujuan",
                    ),
                  ),
                  SizedBox(width: dimenSmall),
                  Expanded(
                    flex: 2,
                    child: OutlinedTextFieldView(
                      textController: controller.lastPageController,
                      isNumber: true,
                      label: "Halaman",
                    ),
                  ),
                ],
              ),
              SizedBox(height: dimenMedium),
              Obx(
                () {
                  return (controller.isInsertDataLoading.value)
                      ? LoadingView()
                      : Container(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            child: Text("Simpan"),
                            onPressed: () {
                              controller.addLiteracyToDatabase();
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
