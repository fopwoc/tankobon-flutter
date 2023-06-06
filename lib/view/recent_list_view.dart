import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:tankobon/gen/strings.g.dart";

@RoutePage()
class RecentListView extends StatelessWidget {
  const RecentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(t.recent.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("recent list WIP ${context.router.current.name}"),
          ],
        ),
      ),
    );
  }
}
