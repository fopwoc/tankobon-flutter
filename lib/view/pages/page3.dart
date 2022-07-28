import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/domain/repositories/current_instance.dart';
import 'package:tankobon/domain/repositories/instances.dart';
import 'package:tankobon/domain/state/global_state.dart';
import 'package:tankobon/router/router.gr.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Settings WIP ${context.router.current.name}'),
            PlatformElevatedButton(
              child: PlatformText('logout'),
              onPressed: () async {
                await delTokenRepository(await getCurrentInstanceRepository());
                await setCurrentInstanceRepository(null);
                Provider.of<GlobalState>(context, listen: false)
                    .setGlobalState(null);
                context.router.replace(const DeciderView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
