import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddLiteracyController extends GetxController {
  User? currentUser = FirebaseAuth.instance.currentUser;

  void addLiteracyToDatabase() {
    CollectionReference literacyReference = FirebaseFirestore.instance
        .collection("literacies")
        .doc("${currentUser?.uid}")
        .collection("books");
    literacyReference.add({
      'book_image' : null,
      'book_title': 'Harry Potter: The Goblet of Fire',
      'target': 'Membaca 1 buku dalam 3 hari',
      'last_page': '24',
    }).then((_) {
      Get.back();
    });
  }
}
