import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/modules/home/views/list_reminder_view.dart';
import 'package:bacakuy_app/app/modules/home/views/quotes_section_view.dart';
import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:bacakuy_app/app/views/views/navigation_drawer_view.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_subtitle_view.dart';
import 'package:bacakuy_app/app/views/views/text_title_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'greeting_view.dart';

class HomeView extends StatelessWidget {

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    controller.getLiteracy();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingView(),
            SizedBox(height: dimenLarge),
            QuotesSectionView(),
            SizedBox(height: dimenLarge),
            ListReminderView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          FontAwesomeIcons.plusCircle,
          color: kPrimaryColor,
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(Routes.ADD_LITERACY)
              ?.whenComplete(() => controller.getLiteracy());
        },
      ),
    );
  }
}
