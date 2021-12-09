import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/quote.dart';

class QuoteProvider extends GetConnect {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Quote>> getQuotes() async {
    CollectionReference quotesReference = _firestore.collection("motivations");

    var snapshots = await quotesReference.get();
    var convertedSnapshots = snapshots.docs.map((e) {
      return Quote.fromSnapshot(e.data() as Map<String, dynamic>);
    }).toList();

    if(convertedSnapshots.isNotEmpty) {
      return convertedSnapshots;
    }else {
      return Future.error("Error while fetching quotes");
    }
  }
}
