import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/presentation/providers/abstract_news_notifier.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/repositories/news/repositories/mock_news_repository.dart';

final featuredNewsProvider =
    StateNotifierProvider<FeaturedNewsNotifier, List<Article>>(
        (ref) => FeaturedNewsNotifier(ref));

class FeaturedNewsNotifier extends NewsNotifier {
  final StateNotifierProviderRef ref;
  FeaturedNewsNotifier(this.ref) : super();

  @override
  void fetchArticles(BuildContext context) async {
    try {
      state = await Future.delayed(
        const Duration(seconds: 2),
        ref.read(mockNewsProvider).getFeaturedArticles,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not fetch articles'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  void markAllRead() async {
    final List<Article> newState = [];
    for (final article in state) {
      newState.add(
        article.copyWith(read: true),
      );
    }
  }

  @override
  void markRead(String id) {
    final index = state.indexWhere((e) => e.id == id);
    final List<Article> newState = [];
    for (int i = 0; i < state.length; i++) {
      if (i == index) {
        newState.add(state[i].copyWith(read: true));
      } else {
        newState.add(state[i]);
      }
    }
    state = newState;
  }

  @override
  Article getArticle(String id) {
    return state.firstWhere((element) => element.id == id);
  }
}
