import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TweetListView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const TweetListView(),
      );
  const TweetListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('Tweet List'),
      ),
    );
  }
}
