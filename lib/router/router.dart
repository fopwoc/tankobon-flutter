import 'package:auto_route/auto_route.dart';
import 'package:tankobon/view/decider.dart';
import 'package:tankobon/view/login.dart';
import 'package:tankobon/view/pages/page1.dart';
import 'package:tankobon/view/pages/page2.dart';
import 'package:tankobon/view/pages/page3.dart';
import 'package:tankobon/view/route_page.dart';
import 'package:tankobon/view/view.dart';

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
        AutoRoute(page: Page1, initial: true),
        AutoRoute(page: Page2),
        AutoRoute(page: Page3),
      ],
    ),
    AutoRoute(path: '/dashboard/view/:uuid', page: ViewPage),
  ],
)
//class AppRouter extends _$AppRouter {}
class $AppRouter {}
