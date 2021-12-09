import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/article.dart';

class ArticleProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Article>> getListArticle() async {
    CollectionReference articlesReference = _firestore.collection("articles");
    var snapshots = await articlesReference.get();

    var convertedSnapshots = snapshots.docs.map((e) {
      return Article.fromSnapshot(e.id, e.data() as Map<String, dynamic>);
    }).toList();

    if(convertedSnapshots.isNotEmpty) {
      return convertedSnapshots;
    }else {
      return Future.error("Error while fetching articles");
    }
  }
}
