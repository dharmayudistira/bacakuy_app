import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return (controller.isLoading.value)
              ? LoadingView()
              : ElevatedButton.icon(
                  onPressed: () {
                    controller.doLogin();
                  },
                  icon: FaIcon(FontAwesomeIcons.google),
                  label: Text("Sign in with google"),
                );
        }),
      ),
    );
  }
}
