import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:revnotes_flutter_pocketbase/src/pages/home_page.dart';
import 'package:revnotes_flutter_pocketbase/src/pages/landing_page.dart';
import 'package:revnotes_flutter_pocketbase/src/pages/login_page.dart';
import 'package:revnotes_flutter_pocketbase/src/pages/signin_page.dart';
import 'package:revnotes_flutter_pocketbase/src/providers/providers.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute { landing, signin, dashboard }

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _key,

    /// Forwards diagnostic messages to the dart:developer log() API.
    // debugLogDiagnostics: true,

    /// Initial Routing Location
    initialLocation: '/${AppRoute.dashboard.name}',

    /// The listeners are typically used to notify clients that the object has been
    /// updated.
    refreshListenable: authState,

    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.landing.name,
        builder: (context, state) {
          return const LandingPage();
        },
      ),
      GoRoute(
        path: '/${AppRoute.signin.name}',
        name: AppRoute.signin.name,
        builder: (context, state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: '/${AppRoute.dashboard.name}',
        name: AppRoute.dashboard.name,
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ],
    redirect: (context, state) {
      /**
      * Your Redirection Logic Code  Here..........
      */
      final isAuthenticated = authState.isValid;

      print('Is Logged In $isAuthenticated');

      /// [state.fullPath] will give current  route Path

      if (state.fullPath == '/${AppRoute.signin.name}') {
        return isAuthenticated
            ? '/${AppRoute.dashboard.name}'
            : '/${AppRoute.signin.name}';
      }

      /// null redirects to Initial Location

      return isAuthenticated ? null : '/';
    },
  );
});
