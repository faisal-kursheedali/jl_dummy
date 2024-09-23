// app_router.dart
import 'package:go_router/go_router.dart';
import 'package:joblisting_user/screens/auth/login/login_screen.dart';
import 'package:joblisting_user/screens/auth/signup/signup_screen.dart';
import 'package:joblisting_user/screens/splashscreen/default_screen.dart';
import 'package:joblisting_user/screens/splashscreen/splash_screen.dart';

class AppRouter {
  static const String initialRoute = '/splash';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String defaultlRoute = '/default';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'default',
        path: '/default',
        builder: (context, state) {
          return const DefaultScreen();
        },
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
    ],
  );
}
