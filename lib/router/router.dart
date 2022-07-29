import 'package:auto_route/auto_route.dart';
import 'package:tankobon/views/decider.dart';
import 'package:tankobon/views/login.dart';
import 'package:tankobon/views/manga_list.dart';
import 'package:tankobon/views/recent.dart';
import 'package:tankobon/views/route_page.dart';
import 'package:tankobon/views/settings.dart';
import 'package:tankobon/views/view.dart';

// part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: DeciderView, initial: true),
    AutoRoute(path: '/login', page: LoginView),
    AutoRoute(
      path: '/dashboard',
      page: DashboardView,
      children: [
        AutoRoute(page: RecentView, initial: true),
        AutoRoute(page: MangaListView),
        AutoRoute(page: SettingsView),
      ],
    ),
    AutoRoute(path: '/dashboard/view/:uuid', page: ViewPage),
  ],
)
//class AppRouter extends _$AppRouter {}
class $AppRouter {}
