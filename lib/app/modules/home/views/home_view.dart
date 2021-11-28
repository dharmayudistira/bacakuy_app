import 'package:bacakuy_app/app/views/views/navigation_drawer_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: NavigationDrawerView(),
      ),
    );
  }
}
