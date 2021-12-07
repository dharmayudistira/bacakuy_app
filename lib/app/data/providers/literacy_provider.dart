import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/literacy.dart';

class LiteracyProvider extends GetConnect {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Literacy>> getListLiteracy(String userId) async {
    CollectionReference booksReference = _firestore
        .collection("literacies")
        .doc(userId)
        .collection("books");

    var snapshots = await booksReference.get();

    var convertedSnapshot = snapshots.docs.map((e) {
      return Literacy.fromSnapshot(e.id, e.data() as Map<String, dynamic>);
    }).toList();

    if (convertedSnapshot.isNotEmpty) {
      return convertedSnapshot;
    }else if(convertedSnapshot.isEmpty){
      return List.empty();
    }else {
      return Future.error("Error while fetching books");
    }
  }
}
