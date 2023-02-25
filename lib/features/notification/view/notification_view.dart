import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const NotificationView(),
      );
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('Notification View'),
      ),
    );
  }
}
