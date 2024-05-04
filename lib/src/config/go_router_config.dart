import 'package:go_router/go_router.dart';
import 'package:revnotes_flutter_pocketbase/src/routes/landing_page.dart';
import 'package:revnotes_flutter_pocketbase/src/routes/register_page.dart';
import 'package:revnotes_flutter_pocketbase/src/routes/signin_page.dart';

// GoRouter configuration
class GoRouterConfig {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}
