import 'package:appwrite_test/common/common.dart';
import 'package:appwrite_test/features/tweet/controller/tweet_controller.dart';
import 'package:appwrite_test/features/tweet/widget/tweet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TweetListView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const TweetListView(),
      );
  const TweetListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTweetProvider).when(
          data: (tweets) {
            return ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (context, index) {
                final tweet = tweets[index];
                return TweetCard(tweet: tweet);
              },
            );
          },
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
