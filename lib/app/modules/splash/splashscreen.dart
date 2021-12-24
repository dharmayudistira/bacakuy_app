import 'dart:async';

import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashscreenView extends StatefulWidget {
  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {

  @override
  void initState() {
    super.initState();
    startSplash();
  }

  startSplash() async {
    var duration = const Duration(seconds: 4);
    return Timer(
      duration,
          () {
        Get.offNamed(Routes.LOGIN);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BACAKUY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(height: 10),
            Text(
              "Yuk Majukan Literasi Bangsa",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
