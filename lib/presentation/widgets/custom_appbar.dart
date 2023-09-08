import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/presentation/styles/styles.dart';

AppBar customAppBar() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/back_arrow.svg',
        width: 9,
        height: 24,
      ),
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
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Mark all read',
            style: appBarTextStyle,
          ),
        ),
      ),
    ],
  );
}
