import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80),
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset("assets/images/social.png"),
            ),
            const Text(
              'BACAKUY',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Yuk Bangkitkan Literasi Bangsa',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {

                },
                icon: FaIcon(FontAwesomeIcons.google),
                label: Text("Sign in"),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Login dengan Google agar lebih praktis",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
