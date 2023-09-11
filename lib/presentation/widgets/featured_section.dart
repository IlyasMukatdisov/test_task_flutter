import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/widgets/featured_item.dart';
import 'package:forestvpn_test/repositories/news/models/loading_state.dart';
import 'package:forestvpn_test/repositories/news/providers/state_provider.dart';
import 'package:forestvpn_test/repositories/news/repositories/mock_news_repository.dart';

class FeaturedSection extends ConsumerStatefulWidget {
  const FeaturedSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeaturedSectionState();
}

class _FeaturedSectionState extends ConsumerState<FeaturedSection> {
  @override
  Widget build(BuildContext context) {
    final featuredNews = ref.watch(featuredArticlesRepositoryProvider);

    return featuredNews.when(
      data: (newsList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 28),
                scrollDirection: Axis.horizontal,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final item = newsList[index];
                  return FeaturedItem(
                    article: item,
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
    );
  }
}
