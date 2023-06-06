import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/domain/provider/dio_provider.dart";
import "package:tankobon/domain/provider/isar_provider.dart";
import "package:tankobon/domain/provider/logger_provider.dart";
import "package:tankobon/gen/strings.g.dart";
import "package:tankobon/router/app_router.dart";
import "package:tankobon/theme/theme.dart";

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  LoggerProvider.init();
  DioProvider.init();
  await IsarProvider.init();

  final appRouter = AppRouter();

  runApp(
    TranslationProvider(
      child: ProviderScope(
        child: Main(
          appRouter: appRouter,
          // themeLight: themeLight,
          // themeDark: themeDark,
        ),
      ),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({
    required this.appRouter,
    super.key,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      initialPlatform: TargetPlatform.iOS,
      builder: (context) {
        return PlatformTheme(
          themeMode: ThemeMode.system,
          materialLightTheme: CustomTheme.materialLight,
          materialDarkTheme: CustomTheme.materialDark,
          cupertinoLightTheme: CustomTheme.cupertinoLight,
          cupertinoDarkTheme: CustomTheme.cupertinoDark,
          builder: (context) => PlatformApp.router(
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            material: (_, __) => MaterialAppRouterData(
              theme: ThemeData(useMaterial3: false),
            ),
            //routerConfig: appRouter.config(),
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
          ),
        );
      },
    );
  }
}
