import 'package:bacakuy_app/app/data/models/literacy.dart';
import 'package:bacakuy_app/app/data/models/quote.dart';
import 'package:bacakuy_app/app/data/providers/literacy_provider.dart';
import 'package:bacakuy_app/app/data/providers/quote_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<Literacy>?> {
  final currentUser = FirebaseAuth.instance.currentUser;
  late List<Quote> listQuotes;

  var loadingQuotes = false.obs;

  var loadingDelete = false.obs;

  @override
  void onInit() {
    super.onInit();
    getQuotes();
    getLiteracy();
  }

  void getLiteracy() {
    change(null, status: RxStatus.loading());
    LiteracyProvider().getListLiteracy(currentUser!.uid).then((value) {
      if (value.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

  void getQuotes() {
    loadingQuotes.toggle();
    QuoteProvider().getQuotes().then((value) {
      listQuotes = value;
      loadingQuotes.toggle();
    });
  }

  void deleteLiteracy(String? id) {
    loadingDelete.toggle();
    var literacyReference = FirebaseFirestore.instance
        .collection("literacies")
        .doc("${currentUser?.uid}")
        .collection("books")
        .doc(id);
    literacyReference.delete().whenComplete(() {
      loadingDelete.toggle();
      getLiteracy();
    });
  }
}
