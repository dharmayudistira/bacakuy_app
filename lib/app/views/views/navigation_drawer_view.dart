import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_title_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NavigationDrawerView extends StatelessWidget {
  final paddingHorizontal = EdgeInsets.symmetric(horizontal: dimenMedium);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: kPrimaryColor,
        child: ListView(
          padding: paddingHorizontal,
          children: [
            _buildHeader(
              imageUrl: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
              name: "Dummy User",
              email: "dummyemail.com",
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
              itemTitle: "Baca Artikel",
              itemIcon: FontAwesomeIcons.book,
              onSelected: () => _selectedItem(1),
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
        title: TextTitleView(
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
      title: TextTitleView(text: itemTitle, textColor: baseColor),
      onTap: onSelected,
    );
  }

  void _selectedItem(int index) {
    Get.back();

    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.ARTICLES);
        break;
      default:
        Get.toNamed(Routes.HOME);
        break;
    }
  }
}
