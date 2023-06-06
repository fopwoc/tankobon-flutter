import "package:auto_route/auto_route.dart";
import "package:flutter/foundation.dart";
import "package:tankobon/view/dashboard_view.dart";
import "package:tankobon/view/decider_view.dart";
import "package:tankobon/view/gallery_view.dart";
import "package:tankobon/view/login_view.dart";
import "package:tankobon/view/manga_list_view.dart";
import "package:tankobon/view/manga_title_view.dart";
import "package:tankobon/view/recent_list_view.dart";
import "package:tankobon/view/settings_view.dart";

part "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(path: "/", page: DeciderRoute.page),
        AutoRoute(path: "/login", page: LoginRoute.page),
        AutoRoute(
          path: "/dashboard",
          page: DashboardRoute.page,
          children: [
            AutoRoute(path: "recent", page: RecentListRoute.page),
            AutoRoute(path: "manga", page: MangaListRoute.page),
            AutoRoute(path: "settings", page: SettingsRoute.page),
          ],
        ),
        AutoRoute(path: "/dashboard/view/:uuid", page: MangaTitleRoute.page),
        AutoRoute(
          path: "/dashboard/view/:manga/:volumeId/:pageId",
          page: GalleryRoute.page,
        ),
      ];
}
