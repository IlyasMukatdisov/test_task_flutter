import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/screens/article_details_screen.dart';
import 'package:forestvpn_test/presentation/screens/home_screen.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

void main() {
  runApp(const ProviderScope(child: ForestVPNTestApp()));
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: 'ForestVPN test',
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ArticleDetailsScreen.routeName:
            {
              final arguments = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) => ArticleDetailsScreen(
                  article: arguments['article'],
                  isLatestClicked: arguments['isLatestClicked'],
                ),
              );
            }
          default:
            return MaterialPageRoute(
              builder: (context) => const Center(
                child: Text('No such route found'),
              ),
            );
        }
      },
    );
  }
}
