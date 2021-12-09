import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/modules/articles/controllers/articles_controller.dart';
import 'package:bacakuy_app/app/modules/home/controllers/home_controller.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_subtitle_view.dart';
import 'package:bacakuy_app/app/views/views/text_title_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GreetingView extends GetView {

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dimenMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitleView(text: "Halo, ${homeController.currentUser?.displayName}!"),
              TextCaptionView(text: "Yuk tingkatkan literasimu dengan kami")
            ],
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(homeController.currentUser?.photoURL ?? "null"),
          ),
        ],
      ),
    );
  }
}
