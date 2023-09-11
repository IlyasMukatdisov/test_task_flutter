import 'package:flutter/material.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final bool isLatestClicked;
  static const routeName = '/article-details';

  final Article article;

  const ArticleDetailsScreen({
    super.key,
    required this.article,
    required this.isLatestClicked,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    RegExp newLineSeparationRegex = RegExp(r'(?<=[^\d.])(\.\s*)');

    String heroTag =
        isLatestClicked ? "${article.id}latest" : "${article.id}featured";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              height: 495,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Hero(
                      tag: heroTag,
                      child: Container(
                        width: screenWidth,
                        height: 495,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              article.imageUrl,
                            ),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.699999988079071),
                              BlendMode.darken,
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 48,
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 21,
              ),
              child: SizedBox(
                width: screenWidth,
                child: Text(
                  article.description?.replaceAllMapped(
                          newLineSeparationRegex, (match) => '.\n\n') ??
                      'No description',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
