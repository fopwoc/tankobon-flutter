import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:tankobon/gen/strings.g.dart";
import "package:tankobon/router/app_router.dart";

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        RecentListRoute(),
        MangaListRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return PlatformScaffold(
          body: child,
          bottomNavBar: PlatformNavBar(
            currentIndex: tabsRouter.activeIndex,
            itemChanged: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).book),
                label: t.dashboard.recent,
              ),
              BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).search),
                label: t.dashboard.instance,
              ),
              BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).settings),
                label: t.dashboard.settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
