import 'package:flutter/material.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';
import 'package:forestvpn_test/presentation/widgets/custom_appbar.dart';
import 'package:forestvpn_test/presentation/widgets/featured_section.dart';
import 'package:forestvpn_test/presentation/widgets/latest_news_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Featured',
                style: sectionTitleStyle,
              ),
              SizedBox(
                height: 20,
              ),
              FeaturedSection(),
              SizedBox(height: 20),
              Text(
                'Latest news',
                style: sectionTitleStyle,
              ),
              SizedBox(
                height: 20,
              ),
              LatestNewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
