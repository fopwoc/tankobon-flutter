import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/domain/state/global_state.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/router/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appRouter = AppRouter();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalState>(create: (_) => GlobalState()),
      ],
      child: PlatformProvider(
        initialPlatform: TargetPlatform.iOS,
        builder: (BuildContext context) => App(
          appRouter: appRouter,
        ),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    context.watch<GlobalState>().initGlobalState();

    return PlatformApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      material: (_, __) => MaterialAppRouterData(
        theme: ThemeData(useMaterial3: true),
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
