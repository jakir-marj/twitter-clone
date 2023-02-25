import 'package:appwrite_test/common/common.dart';
import 'package:appwrite_test/features/auth/controller/auth_controller.dart';
import 'package:appwrite_test/features/auth/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/home/view/home_view.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {
            if (user != null) {
              return const HomeView();
            }
            return const SignupView();
          },
          error: (error, sr) => ErrorPage(
                error: error.toString(),
              ),
          loading: () => const LoadingPage()),
    );
  }
}
