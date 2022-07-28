import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/router/router.gr.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        Route1(),
        Route2(),
        Route3(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return PlatformScaffold(
          body: child,
          bottomNavBar: PlatformNavBar(
            currentIndex: tabsRouter.activeIndex,
            itemChanged: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'test1'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'test2'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'test3'),
            ],
          ),
        );
      },
    );
  }
}
