import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/providers/featured_news_provider.dart';
import 'package:forestvpn_test/presentation/widgets/featured_item.dart';

class FeaturedSection extends ConsumerStatefulWidget {
  const FeaturedSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeaturedSectionState();
}

class _FeaturedSectionState extends ConsumerState<FeaturedSection> {
  @override
  void initState() {
    ref.read(featuredNewsProvider.notifier).fetchArticles(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final featuredNews = ref.watch(featuredNewsProvider);

    if (featuredNews.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: featuredNews.length,
        itemBuilder: (context, index) {
          final item = featuredNews[index];
          return FeaturedItem(
            article: item,
          );
        },
      ),
    );
  }
}
