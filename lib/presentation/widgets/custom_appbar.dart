import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';
import 'package:forestvpn_test/repositories/news/models/loading_state.dart';
import 'package:forestvpn_test/repositories/news/providers/state_provider.dart';
import 'package:forestvpn_test/repositories/news/repositories/mock_news_repository.dart';

AppBar customAppBar() {
  return AppBar(
    leading: Consumer(
      builder: (context, ref, child) {
        return IconButton(
          onPressed: () {
            ref.read(mockNewsProvider).debugPrintReadStatus();
          },
          icon: SvgPicture.asset(
            'assets/icons/back_arrow.svg',
            width: 9,
            height: 24,
          ),
        );
      },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'Notifications',
      style: appBarTextStyle,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Consumer(
          builder: (context, ref, child) {
            return TextButton(
              onPressed: () {
                ref.read(mockNewsProvider).markAllRead();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('All news marked as read'),
                  ),
                );
              },
              child: const Text(
                'Mark all read',
                style: appBarTextStyle,
              ),
            );
          },
        ),
      ),
    ],
  );
}
