import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/data/preferences/preferences_provider.dart';
import 'package:bacakuy_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacakuy'),
        centerTitle: true,
      ),
      body: _buildSetting(context),
    );
  }

  Widget _buildSetting(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ListTile(
              title: Text('Reminder'),
              trailing: Switch.adaptive(value: true, onChanged: null),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: dimenMedium),
          width: double.maxFinite,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red
            ),
            onPressed: () {
              loginController.doLogout();
            },
            child: Text("Logout"),
          ),
        ),
      ],
    );
  }
}
