import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/providers/latest_news_provider.dart';
import 'package:forestvpn_test/presentation/widgets/latest_arctice_item.dart';

class LatestNewsSection extends ConsumerStatefulWidget {
  const LatestNewsSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeaturedSectionState();
}

class _FeaturedSectionState extends ConsumerState<LatestNewsSection> {
  @override
  void initState() {
    ref.read(latestNewsProvider.notifier).fetchArticles(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final latestNews = ref.watch(latestNewsProvider);

    if (latestNews.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          scrollDirection: Axis.vertical,
          itemCount: latestNews.length,
          itemBuilder: (context, index) {
            final item = latestNews[index];
            return LatestArticleItem(
              id: item.id,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
