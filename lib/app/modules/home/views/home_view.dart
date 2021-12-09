import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:bacakuy_app/app/views/views/navigation_drawer_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  int index = 0;
  List<String> cardList = [
    "Makin aku banyak membaca, makin banyak aku berpikir; makin banyak aku belajar, makin sadar bahwa aku tidak mengetahui apa pun.",
    "Ilmu itu ada di mana-mana, pengetahuan di mana-mana tersebar, kalau kita bersedia membaca, dan bersedia mendengar.",
    "Membaca adalah napas hidup dan jembatan emas ke masa depan.Membaca adalah napas hidup dan jembatan emas ke masa depan."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bacakuy',
        ),
        centerTitle: true,
      ),
      drawer: SafeArea(child: NavigationDrawerView()),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundList(),
            Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "Hallo Bacakuyers!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text("Yuk periksa agenda mu hari ini!",
                    style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset("assets/images/selecting.png"),
                ),
                Container(
                  child: Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 3000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        aspectRatio: 4,
                      ),
                      items: cardList.map((item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                listReminder(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_LITERACY);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget backgroundList() {
    return Container(
      decoration: BoxDecoration(),
    );
  }

  Widget listReminder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.grey,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
                title: const Text(
                  "Read 30 pages",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Books: The Intelligent Investor"),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                onTap: () {}),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
                title: const Text(
                  "Read 30 pages",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Books: The Intelligent Investor"),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                onTap: () {}),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
                title: const Text(
                  "Read 30 pages",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Books: The Intelligent Investor"),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                onTap: () {}),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
                title: const Text(
                  "Read 30 pages",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Books: The Intelligent Investor"),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                onTap: () {}),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
                title: const Text(
                  "Read 30 pages",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Books: The Intelligent Investor"),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                onTap: () {}),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
                title: const Text(
                  "Read 30 pages",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Books: The Intelligent Investor"),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                onTap: () {}),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
              title: const Text(
                "Read 30 pages",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Books: The Intelligent Investor"),
              trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: ListTile(
                title: const Text(
                  "Read 30 pages",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Books: The Intelligent Investor"),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                onTap: () {}),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;

  const ItemCard(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 2),
        ],
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
