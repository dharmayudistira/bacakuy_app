import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/data/models/article.dart';
import 'package:bacakuy_app/app/modules/articles/views/article_item_view.dart';
import 'package:bacakuy_app/app/views/views/loading_view.dart';
import 'package:bacakuy_app/app/views/views/navigation_drawer_view.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_title_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/articles_controller.dart';

class ArticlesView extends StatelessWidget {

  final controller = Get.put(ArticlesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Artikel'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: dimenMedium),
            separatorBuilder: (_, __) {
              return SizedBox(height: dimenMedium);
            },
            itemCount: state?.length ?? 0,
            itemBuilder: (context, index) {
              final article = state?[index];

              return ArticleItemView(article: article);
            },
            physics: BouncingScrollPhysics(),
          );
        },
        onLoading: LoadingView(),
        onError: (message) {
          return Center(
            child: Text("Error: $message"),
          );
        },
      ),
    );
  }
}
