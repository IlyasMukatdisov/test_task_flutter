import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';
import 'package:forestvpn_test/presentation/widgets/featured_item.dart';
import 'package:forestvpn_test/presentation/widgets/latest_arctice_item.dart';
import 'package:forestvpn_test/repositories/news/repositories/mock_news_repository.dart';

class LatestNewsSection extends ConsumerStatefulWidget {
  const LatestNewsSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeaturedSectionState();
}

class _FeaturedSectionState extends ConsumerState<LatestNewsSection> {
  @override
  Widget build(BuildContext context) {
    final latestNews = ref.watch(latestArticlesRepositoryProvider);

    return latestNews.when(
      data: (newsList) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            scrollDirection: Axis.vertical,
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final item = newsList[index];
              return LatestArticleItem(article: item);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
        ),
      ),
    );
  }
}
