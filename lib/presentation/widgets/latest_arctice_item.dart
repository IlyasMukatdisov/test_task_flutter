import 'package:flutter/material.dart';
import 'package:forestvpn_test/presentation/screens/article_details_screen.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class LatestArticleItem extends StatelessWidget {
  final Article article;
  const LatestArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ArticleDetailsScreen.routeName,
          arguments: {
            'article': article,
            'isLatestClicked': true,
          },
        );
      },
      child: Container(
        width: 358,
        height: 103,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 20,
              offset: Offset(4, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0xFFFFFFFF),
              blurRadius: 8,
              offset: Offset(-4, -4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Hero(
                tag: "${article.id}latest",
                child: Container(
                  width: 90,
                  height: 60,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(article.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 190,
                      height: 38,
                      child: Text(
                        article.title,
                        style: latestArticleTitleTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      "${DateTime.now().difference(article.publicationDate).inDays.toString()} day ago",
                      style: latestArticleSubtitleTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    // return ListTile(
    //   leading: ClipRRect(
    //     borderRadius: BorderRadius.circular(12),
    //     child: Image.network(
    //       article.imageUrl,
    //       width: 90,
    //       height: 60,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   title: SizedBox(
    //     width: 190,
    //     child: Text(
    //       article.title,
    //       style: latestArticleTitleTextStyle,
    //       maxLines: 2,
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //   ),
    //   subtitle: Padding(
    //     padding: const EdgeInsets.only(top: 10),
    //     child: Text(
    //       "${DateTime.now().difference(article.publicationDate).inDays.toString()} day ago",
    //       style: latestArticleSubtitleTextStyle,
    //     ),
    //   ),
    // );
  }
}
