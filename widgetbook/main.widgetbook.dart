import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/domain/provider/dio_provider.dart";
import "package:tankobon/domain/provider/logger_provider.dart";
import "package:tankobon/gen/strings.g.dart";
import "package:tankobon/theme/theme.dart";
import "package:widgetbook/widgetbook.dart";

import "cases/common/cover.dart";
import "cases/common/form/login.dart";
import "cases/common/list/cover_list.dart";
import "cases/common/ratio.dart";
import "cases/common/spin_button.dart";
import "cases/view/title/title_description.dart";
import "cases/view/title/title_meta.dart";
import "cases/view/title/volume_list_item.dart";

final directories = [
  WidgetbookCategory(
    name: "Common",
    children: [
      caseSpinButton,
      caseCover,
      caseRation,
      WidgetbookComponent(
        name: "Form",
        useCases: [
          caseLoginForm,
        ],
      ),
      WidgetbookComponent(
        name: "List",
        useCases: [
          caseCoverList,
        ],
      ),
    ],
  ),
  WidgetbookCategory(
    name: "View",
    children: [
      WidgetbookComponent(
        name: "Title",
        useCases: [
          caseTitleMeta,
          caseTitleDescription,
          caseVolumeItemList,
        ],
      ),
    ],
  ),
];

final themes = ThemeAddon(
  themes: [
    WidgetbookTheme(
      name: "cupertino light",
      data: CustomTheme.cupertinoLight,
    ),
    WidgetbookTheme(
      name: "cupertino dark",
      data: CustomTheme.cupertinoDark,
    ),
    WidgetbookTheme(
      name: "material light",
      data: CustomTheme.materialLight,
    ),
    WidgetbookTheme(
      name: "material dark",
      data: CustomTheme.materialDark,
    ),
  ],
  themeBuilder: (context, theme, child) {
    final materialTheme = (theme is ThemeData) ? theme : null;
    final cupertinoTheme = (theme is CupertinoThemeData) ? theme : null;

    return PlatformProvider(
      initialPlatform: (cupertinoTheme != null)
          ? TargetPlatform.iOS
          : TargetPlatform.android,
      builder: (context) => PlatformTheme(
        themeMode: (materialTheme?.brightness == Brightness.light ||
                cupertinoTheme?.brightness == Brightness.light)
            ? ThemeMode.light
            : ThemeMode.dark,
        materialLightTheme: materialTheme,
        materialDarkTheme: materialTheme,
        cupertinoLightTheme: cupertinoTheme,
        cupertinoDarkTheme: cupertinoTheme,
        builder: (BuildContext context) => child,
      ),
    );
  },
);

final scales = TextScaleAddon(
  scales: [
    1,
    1.25,
    1.50,
    1.75,
    2,
  ],
);

final localization = LocalizationAddon(
  locales: [...AppLocaleUtils.supportedLocales],
  localizationsDelegates: [
    DefaultWidgetsLocalizations.delegate,
    DefaultMaterialLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ],
);

final devices = DeviceFrameAddon(
  devices: [
    Devices.ios.iPhone13Mini,
    Devices.ios.iPhone13,
    Devices.ios.iPhone13ProMax,
    Devices.ios.iPhoneSE,
  ],
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioProvider.init();
  LoggerProvider.init();

  runApp(
    TranslationProvider(
      child: const ProviderScope(
        child: Main(),
      ),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      directories: directories,
      addons: [
        themes,
        scales,
        localization,
        devices,
      ],
      appBuilder: (context, child) {
        return PlatformApp(
          //locale: TranslationProvider.of(context).flutterLocale,
          //supportedLocales: locales,
          //localizationsDelegates: context.localization!.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          home: child,
        );
        //
        // final frameBuilder = context.frameBuilder;
        //
        // return frameBuilder == null
        //     ? builder
        //     : frameBuilder(
        //         context,
        //         builder,
        //       );
      },
    );
  }
}
