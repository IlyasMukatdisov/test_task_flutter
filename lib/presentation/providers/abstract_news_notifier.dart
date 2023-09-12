import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

abstract class NewsNotifier extends StateNotifier<List<Article>> {
  NewsNotifier() : super([]);
  void fetchArticles(BuildContext context);
  Article getArticle(String id);
  void markRead(String id);
  void markAllRead();
}
