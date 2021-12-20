import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/modules/home/controllers/home_controller.dart';
import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_subtitle_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class ListReminderView extends GetView {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 2),
          ],
          color: kPrimaryColor,
        ),
        child: homeController.obx(
          (state) {
            return Padding(
              padding: EdgeInsets.all(dimenMedium),
              child: ListView.builder(
                itemCount: state?.length,
                itemBuilder: (context, index) {
                  final literacy = state?[index];

                  return ListTile(
                    title: TextSubtitleView(
                      text: literacy?.target ?? "Tidak ada target",
                      textColor: Colors.white,
                    ),
                    subtitle: TextCaptionView(
                      text: literacy?.bookTitle ?? "Tidak ada judul buku",
                      textColor: Colors.white,
                    ),
                    trailing: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.trash,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        //should be delete
                      },
                    ),
                    onTap: () {
                      Get.toNamed(Routes.ADD_LITERACY, arguments: literacy)
                          ?.whenComplete(() => homeController.getLiteracy());
                    },
                  );
                },
              ),
            );
          },
          onLoading: LoadingView(),
          onEmpty: Center(child: Text("Empty")),
          onError: (errorMessage) {
            return Center(child: Text("Error"));
          },
        ),
      ),
    );
  }
}
