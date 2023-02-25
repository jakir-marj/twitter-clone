import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../features/explore/view/explore_view.dart';
import '../features/notification/view/notification_view.dart';
import '../features/tweet/widget/tweet_list_view.dart';

import '../theme/pallete.dart';
import 'assets_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    TweetListView(),
    ExploreView(),
    NotificationView(),
  ];
}
