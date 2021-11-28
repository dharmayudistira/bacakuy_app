import 'package:bacakuy_app/app/data/models/article.dart';
import 'package:bacakuy_app/app/data/providers/article_provider.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController with StateMixin<List<Article>?> {

  @override
  void onInit() {
    super.onInit();

    change(null, status: RxStatus.loading());
    ArticleProvider().getListArticle().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (message) {
      change(null, status: RxStatus.error(message.toString()));
    });
  }

}

class HomeController extends GetxController with StateMixin<List<Article>?> {
  @override
  void onInit() {
    super.onInit();

    change(null, status: RxStatus.loading());
    ArticleProvider().getListArticle().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (message) {
      change(null, status: RxStatus.error(message.toString()));
    });
  }
}
