import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/providers/featured_news_provider.dart';
import 'package:forestvpn_test/presentation/providers/latest_news_provider.dart';
import 'package:forestvpn_test/presentation/screens/article_details_screen.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';

class LatestArticleItem extends ConsumerWidget {
  final String id;
  const LatestArticleItem({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article = ref.watch(latestNewsProvider.notifier).getArticle(id);
    return InkWell(
      onTap: () {
        ref.read(latestNewsProvider.notifier).markRead(article.id);
        ref.read(featuredNewsProvider.notifier).markRead(article.id);
        Navigator.of(context).pushNamed(
          ArticleDetailsScreen.routeName,
          arguments: {
            'article': article,
            'isLatestClicked': true,
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 103,
        decoration: ShapeDecoration(
          color: article.read ? const Color(0xFFF5F5F5) : Colors.white,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400]
                      ),
                    ),
                    imageUrl: article.imageUrl,
                    width: 90,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
