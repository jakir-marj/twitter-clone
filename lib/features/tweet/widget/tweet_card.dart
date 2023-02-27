import 'package:appwrite_test/model/tweet_model.dart';
import 'package:appwrite_test/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/common.dart';
import '../../auth/controller/auth_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class TweetCard extends ConsumerWidget {
  final Tweet tweet;
  const TweetCard({
    required this.tweet,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDetailsProvider(tweet.uid)).when(
          data: (user) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: KCachedImg(imageUrl: user.profilePic),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text(
                                user.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                            Text(
                              "@${user.name} . ${timeago.format(tweet.tweetedAt, locale: 'en_short')}",
                              style: const TextStyle(
                                color: Pallete.greyColor,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            );
          },
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
