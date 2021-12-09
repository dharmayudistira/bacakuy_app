import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/modules/home/controllers/home_controller.dart';
import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_subtitle_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QuotesSectionView extends GetView {

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: dimenMedium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: dimenSmall / 2,
                height: dimenMedium,
                color: kPrimaryColor,
              ),
              SizedBox(width: dimenSmall),
              TextSubtitleView(
                text: "Motivasi hari ini",
              ),
            ],
          ),
        ),
        SizedBox(height: dimenMedium),
        Obx(() {
          return (homeController.loadingQuotes.value)
              ? LoadingView()
              : _buildQuotesCarousel();
        }),
      ],
    );
  }

  Widget _buildQuotesCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 3000),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
        aspectRatio: 3.5,
      ),
      items: homeController.listQuotes.map((e) {
        return _buildQuoteItem(e.quote);
      }).toList(),
    );
  }

  Widget _buildQuoteItem(String? quote) {
    return Container(
      width: Get.size.width * 0.7,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 2),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(dimenSmall),
        child: TextCaptionView(
          text: quote ?? "",
          isCenter: true,
        ),
      ),
    );
  }
}
