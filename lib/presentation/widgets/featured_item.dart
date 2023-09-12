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
    double itemWidth = screenWidth < 358 ? screenWidth - 28 : 358;

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
      child: SizedBox(
        width: itemWidth,
        height: 300,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Hero(
                tag: "${article.id}featured",
                child: Container(
                  width: itemWidth,
                  height: 300,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(article.imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.699999988079071),
                        BlendMode.darken,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
