import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/providers/featured_news_provider.dart';
import 'package:forestvpn_test/presentation/providers/latest_news_provider.dart';
import 'package:forestvpn_test/presentation/screens/article_details_screen.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class FeaturedItem extends ConsumerWidget {
  final Article article;

  const FeaturedItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth - 76;

    return InkWell(
      onTap: () {
        ref.read(latestNewsProvider.notifier).markRead(article.id);
        ref.read(featuredNewsProvider.notifier).markRead(article.id);
        Navigator.of(context).pushNamed(
          ArticleDetailsScreen.routeName,
          arguments: {
            'article': article,
            'isLatestClicked': false,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: itemWidth,
        height: 300,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Hero(
                tag: "${article.id}featured",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(color: Colors.grey[400]),
                    ),
                    imageUrl: article.imageUrl,
                    width: itemWidth,
                    height: 300,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.699999988079071),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 40,
              child: SizedBox(
                width: 270,
                child: Text(
                  article.title,
                  style: featuredTitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
