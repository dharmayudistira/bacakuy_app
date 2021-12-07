import 'package:bacakuy_app/app/data/models/literacy.dart';
import 'package:bacakuy_app/app/data/providers/literacy_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProgressLiteracyController extends GetxController with StateMixin<List<Literacy>?> {

  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  void onInit() {
    super.onInit();

    refreshData();
  }

  void refreshData() {
    change(null, status: RxStatus.loading());
    LiteracyProvider().getListLiteracy(userId).then((value) {
      if(value.isNotEmpty) {
        change(value, status: RxStatus.success());
      }else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

}
