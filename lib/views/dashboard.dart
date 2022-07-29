import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/router/router.gr.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AutoTabsRouter(
      routes: const [
        RecentView(),
        MangaListView(),
        SettingsView(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return PlatformScaffold(
          body: child,
          bottomNavBar: PlatformNavBar(
            currentIndex: tabsRouter.activeIndex,
            itemChanged: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).book),
                label: l10n.dashboardNavBarRecent,
              ),
              BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).search),
                label: l10n.dashboardNavBarList,
              ),
              BottomNavigationBarItem(
                icon: Icon(PlatformIcons(context).settings),
                label: l10n.dashboardNavBarSettings,
              ),
            ],
          ),
        );
      },
    );
  }
}
