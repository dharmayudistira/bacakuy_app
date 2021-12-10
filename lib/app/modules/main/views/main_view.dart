import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/modules/articles/views/articles_view.dart';
import 'package:bacakuy_app/app/modules/home/views/home_view.dart';
import 'package:bacakuy_app/app/modules/setting/views/setting_view.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var selectedIndex = 0;

  final listScreen = [HomeView(), ArticlesView(), SettingView()];
  final listScreenAttribute = [
    {"title": "Beranda", "icon": FontAwesomeIcons.home},
    {"title": "Artikel", "icon": FontAwesomeIcons.book},
    {"title": "Pengaturan", "icon": FontAwesomeIcons.cog},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedIndex,
        showElevation: true,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: listScreenAttribute.map((e) {
          return BottomNavyBarItem(
            activeColor: kPrimaryColor,
            icon: FaIcon(
              e["icon"] as IconData,
              size: 18,
            ),
            title: TextCaptionView(
              text: e["title"] as String,
              textColor: kPrimaryColor,
            ),
            textAlign: TextAlign.center,
          );
        }).toList(),
      ),
      body: listScreen[selectedIndex],
    );
  }
}
