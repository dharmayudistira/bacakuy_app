import 'package:bacakuy_app/app/data/preferences/preferences_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
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
    //return Consumer<PreferencesProvider>(
    //builder: (context, provider, child){
    return ListView(
      children: [
        Column(
          children: [
            Material(
              child: ListTile(
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(value: true, onChanged: null),
              ),
            ),
            Material(
              child: ListTile(
                title: Text('Reminder'),
                trailing: Switch.adaptive(value: true, onChanged: null),
              ),
            ),
            Material(
              child: ListTile(
                title: TextButton(
                  onPressed: () {},
                  child: Text('Logout', style: TextStyle(color: Colors.red),),
                ),
              ),
            ),
          ],
        )
      ],
    );
    //}
    // );
  }
}
