import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixie/src/ui/home/home_screen.dart';

import '../services/local_storage.dart';
import '../ui/error/error_load_layout.dart';
import '../ui/splash/splash_screen.dart';

part 'routes_screen.dart';

class GoRouters {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String errorLoadRoute = '404';

  // loading
  static const String loadinRoute = 'loading';

  // Auth
  static const String loginRoute = 'login';
  static const String registerRoute = 'signup';

  // Home
  static const String homeRoute = 'home';
  static const String ratingRoute = 'rating';

  static final GoRouter _router = GoRouter(
    initialLocation: '/$loadinRoute',
    navigatorKey: navigatorKey,
    errorBuilder: (context, state) => const ErrorLoadLayoud(),
    errorPageBuilder: (context, state) => const MaterialPage(
      child: ErrorLoadLayoud(),
    ),
    routes: [
      GoRoute(
        name: loadinRoute,
        path: '/$loadinRoute',
        pageBuilder: _loading,
      ),
      GoRoute(
        name: homeRoute,
        path: '/$homeRoute',
        pageBuilder: _home,
      )
    ],
  );

  static GoRouter get router => _router;
}
