import 'package:bacakuy_app/app/data/models/literacy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddLiteracyController extends GetxController {
  User? currentUser = FirebaseAuth.instance.currentUser;

  late TextEditingController bookTitleController;
  late TextEditingController targetController;
  late TextEditingController lastPageController;
  late TextEditingController dateController;

  var isInsertDataLoading = false.obs;

  final argumentLiteracy = Get.arguments;
  late Literacy? editLiteracy;

  @override
  void onInit() {
    super.onInit();

    if (argumentLiteracy != null) {
      editLiteracy = argumentLiteracy as Literacy;
    } else {
      editLiteracy = null;
    }

    bookTitleController = TextEditingController(text: editLiteracy?.bookTitle);
    targetController = TextEditingController(text: editLiteracy?.target);
    lastPageController = TextEditingController(text: editLiteracy?.lastPage);
    dateController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    bookTitleController.dispose();
    targetController.dispose();
    lastPageController.dispose();
    dateController.dispose();
  }

  bool validateInputs() {
    if (bookTitleController.value.text.isEmpty) {
      showSnackbar("Terjadi kesalahan!", "Kolom judul buku harus diisi");
      return false;
    } else if (targetController.value.text.isEmpty) {
      showSnackbar("Terjadi kesalahan!", "Kolom target / tujuan harus diisi");
      return false;
    } else if (lastPageController.value.text.isEmpty) {
      showSnackbar("Terjadi kesalahan!", "Kolom halaman harus diisi");
      return false;
    }
    // else if (dateController.value.text.isEmpty) {
    //   showSnackbar("Kolom tanggal harus diisi");
    //   return false;
    // }
    else {
      return true;
    }
  }

  void editLiteracyFromDatabase() {
    isInsertDataLoading.toggle();

    final isValid = validateInputs();
    if (!isValid) {
      isInsertDataLoading.toggle();
      return;
    }

    final bookTitle = bookTitleController.value.text;
    final target = targetController.value.text;
    final lastPage = lastPageController.value.text;

    var literacyReference = FirebaseFirestore.instance
        .collection("literacies")
        .doc("${currentUser?.uid}")
        .collection("books")
        .doc(editLiteracy?.id);
    literacyReference.update({
      'book_image': null,
      'book_title': bookTitle,
      'target': target,
      'last_page': lastPage,
    }).then((_) {
      Get.back();
      showSnackbar("Literasi berhasil ditambahkan",
          "$bookTitle telah berhasil ditambahkan");
    });
  }

  void addLiteracyToDatabase() {
    isInsertDataLoading.toggle();

    final isValid = validateInputs();
    if (!isValid) {
      isInsertDataLoading.toggle();
      return;
    }

    final bookTitle = bookTitleController.value.text;
    final target = targetController.value.text;
    final lastPage = lastPageController.value.text;

    CollectionReference literacyReference = FirebaseFirestore.instance
        .collection("literacies")
        .doc("${currentUser?.uid}")
        .collection("books");
    literacyReference.add({
      'book_image': null,
      'book_title': bookTitle,
      'target': target,
      'last_page': lastPage,
    }).then((_) {
      Get.back();
      showSnackbar("Literasi berhasil ditambahkan",
          "$bookTitle telah berhasil ditambahkan");
    });
  }

  void showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }
}
