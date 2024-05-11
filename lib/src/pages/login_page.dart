import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revnotes_flutter_pocketbase/src/providers/providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Login Page"),
            ElevatedButton(
              onPressed: () async {
                // ref.read(authProvider.notifier).signIn();
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
