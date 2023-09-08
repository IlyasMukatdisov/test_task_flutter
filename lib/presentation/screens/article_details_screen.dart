import 'package:flutter/material.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const routeName = '/article-details';

  final Article article;

  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 495,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Hero(
                  tag: article.id,
                  child: Container(
                    width: double.infinity,
                    height: 495,
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
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.699999988079071),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 21,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              '',
              style: TextStyle(
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
    );
  }
}
