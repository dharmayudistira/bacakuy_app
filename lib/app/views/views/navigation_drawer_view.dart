import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_subtitle_view.dart';
import 'package:bacakuy_app/app/views/views/text_title_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NavigationDrawerView extends StatelessWidget {
  final paddingHorizontal = EdgeInsets.symmetric(horizontal: dimenMedium);

  @override
  Widget build(BuildContext context) {

    final currentUser = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Material(
        color: kPrimaryColor,
        child: ListView(
          padding: paddingHorizontal,
          children: [
            _buildHeader(
              imageUrl: currentUser?.photoURL ?? "null",
              name: currentUser?.displayName ?? "error name",
              email: currentUser?.email ?? "error email",
              onClicked: () {},
            ),
            Divider(color: Colors.white70),
            SizedBox(height: dimenMedium),
            _buildDrawerItem(
              itemTitle: "Beranda",
              itemIcon: FontAwesomeIcons.home,
              onSelected: () => _selectedItem(0),
            ),
            _buildDrawerItem(
              itemTitle: "Progress Literasi",
              itemIcon: FontAwesomeIcons.chartBar,
              onSelected: () => _selectedItem(1),
            ),
            _buildDrawerItem(
              itemTitle: "Baca Artikel",
              itemIcon: FontAwesomeIcons.book,
              onSelected: () => _selectedItem(2),
            ),
            _buildDrawerItem(
              itemTitle: "Pengaturan",
              itemIcon: FontAwesomeIcons.cog,
              onSelected: () => _selectedItem(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader({
    required String imageUrl,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) {
    final baseColor = Colors.white;

    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: TextSubtitleView(
          text: name,
          textColor: baseColor,
        ),
        subtitle: TextCaptionView(
          text: email,
          textColor: baseColor,
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String itemTitle,
    required IconData itemIcon,
    required VoidCallback onSelected,
  }) {
    final baseColor = Colors.white;

    return ListTile(
      leading: FaIcon(itemIcon, color: baseColor, size: 20),
      title: TextSubtitleView(text: itemTitle, textColor: baseColor),
      onTap: onSelected,
    );
  }

  void _selectedItem(int index) {
    Get.back();

    switch (index) {
      case 0:
        Get.offNamed(Routes.HOME);
        break;
      case 1:
        Get.offNamed(Routes.PROGRESS_LITERACY);
        break;
      case 2:
        Get.offNamed(Routes.ARTICLES);
        break;
      case 3:
        Get.offNamed(Routes.SETTING);
        break;
      default:
        Get.offNamed(Routes.HOME);
        break;
    }
  }
}
