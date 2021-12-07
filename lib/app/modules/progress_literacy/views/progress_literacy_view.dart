import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/progress_literacy_controller.dart';

class ProgressLiteracyView extends GetView<ProgressLiteracyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Literasi'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Get.toNamed(Routes.ADD_LITERACY)
              ?.whenComplete(() => controller.refreshData());
        },
        child: FaIcon(FontAwesomeIcons.plusCircle),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state?.length,
          itemBuilder: (context, index) {
            final book = state?[index];
            return ListTile(
              title: Text(book?.id ?? "no id"),
            );
          },
        ),
        onLoading: LoadingView(),
        onError: (error) {
          return Center(
            child: Text("Error"),
          );
        },
        onEmpty: Center(
          child: Text("Empty"),
        ),
      ),
    );
  }
}
