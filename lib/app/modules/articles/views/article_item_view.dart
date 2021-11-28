import 'package:bacakuy_app/app/constants/dimen_constants.dart';
import 'package:bacakuy_app/app/data/models/article.dart';
import 'package:bacakuy_app/app/views/views/text_caption_view.dart';
import 'package:bacakuy_app/app/views/views/text_subtitle_view.dart';
import 'package:bacakuy_app/app/views/views/text_title_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItemView extends StatelessWidget {
  final Article? article;

  ArticleItemView({
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(article?.sourceUrl ?? "null")) {
          final url = article!.sourceUrl!;
          await launch(url);
        }
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: dimenSmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(),
              title: TextTitleView(
                text: article?.authorName ?? "Penerbit tidak diketahui",
              ),
              subtitle: TextCaptionView(
                text: article?.releaseDate ?? "Tanggal terbit tidak diketahui",
              ),
            ),
            Image.network(
              article?.imageUrl ?? "null",
              fit: BoxFit.cover,
              height: 200,
              width: double.maxFinite,
            ),
            SizedBox(height: dimenMedium),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: dimenMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSubtitleView(
                      text: article?.title ?? "Judul tidak diketahui"),
                  SizedBox(height: dimenSmall),
                  TextCaptionView(
                      text:
                          article?.description ?? "Deskripsi tidak diketahui"),
                  SizedBox(height: dimenSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
