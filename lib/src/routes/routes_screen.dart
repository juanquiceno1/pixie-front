part of 'routes.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage _loading(BuildContext context, GoRouterState state) =>
    buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: const SplashScreen(),
    );

CustomTransitionPage _home(BuildContext context, GoRouterState state) =>
    buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: const HomeScreen(),
    );
