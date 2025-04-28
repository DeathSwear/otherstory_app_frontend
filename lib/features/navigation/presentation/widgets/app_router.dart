import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/auth_page/presentation/screens/login_screen.dart';
import 'package:otherstory_app/features/auth_page/presentation/screens/register_screen.dart';
import 'package:otherstory_app/features/main_page/presentation/screens/main_screen.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_product_model.dart';
import 'package:otherstory_app/features/meditations_page/presentation/screens/meditations_player_screen.dart';
import 'package:otherstory_app/features/meditations_page/presentation/screens/meditations_screen.dart';
import 'package:otherstory_app/features/navigation/presentation/screens/scaffold_with_nav_bar.dart';
import 'package:otherstory_app/features/profile_page/presentation/screens/profile_screen.dart';
import 'package:otherstory_app/features/statistics_page/presentation/screens/statistics_screen.dart';

import '../../../main_page/data/models/story_content_model.dart';
import '../../../main_page/presentation/screens/story_content_screen.dart';
import '../../../onboarding_page/view/onboarding.screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // 👇 StoryContentScreen — ВНЕ Shell-а
      GoRoute(
        path: '/story',
        builder: (context, state) {
          final stories = state.extra as List<StoryContentModel>;
          final index =
              int.tryParse(state.uri.queryParameters['index'] ?? '0') ?? 0;
          return StoryContentScreen(stories: stories, initialIndex: index);
        },
      ),

      GoRoute(
        path: '/meditations',
        builder: (context, state) => const MeditationsScreen(),
      ),

      GoRoute(
        path: '/meditations_player',
        builder: (context, state) {
          final product = state.extra as MeditationsProductModel;
          return MeditationPlayerScreen(
            initialProduct: product,
          );
        },
      ),

      StatefulShellRoute(
        builder: (context, state, navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (context, navigationShell, children) {
          return ScaffoldWithNavBar(
            navigationShell: navigationShell,
            children: children,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const MainScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/statistics',
                builder: (context, state) => const StatisticsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
