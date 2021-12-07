import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:bacakuy_app/app/views/views/navigation_drawer_view.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_subtitle_view.dart';
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
      drawer: SafeArea(
        child: NavigationDrawerView(),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state?.length,
          itemBuilder: (context, index) {
            final book = state?[index];
            return ListTile(
              leading: ClipRRect(
                child: Container(
                  width: 75,
                  child: Image.network(
                    book?.bookImage ?? "https://via.placeholder.com/150",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: TextSubtitleView(
                text: book?.target ?? "Tidak ada target",
              ),
              subtitle: TextCaptionView(
                text: book?.bookTitle ?? "Tidak ada judul",
              ),
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
