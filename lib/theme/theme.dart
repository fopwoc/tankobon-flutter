import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:tankobon/theme/colors.dart";

class CustomTheme {
  static CupertinoThemeData get cupertinoLight {
    return CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: CustomColorsLight.secondary,
      primaryContrastingColor: CustomColorsLight.onSecondary,
    );
  }

  static CupertinoThemeData get cupertinoDark {
    return CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: CustomColorsDark.secondary,
      primaryContrastingColor: CustomColorsDark.onSecondary,
    );
  }

  static ColorScheme get materialSchemeLight {
    return ColorScheme.light(
      primary: CustomColorsLight.primary,
      onPrimary: CustomColorsLight.onPrimary,
      primaryContainer: CustomColorsLight.primaryContainer,
      onPrimaryContainer: CustomColorsLight.onPrimaryContainer,
      secondary: CustomColorsLight.secondary,
      onSecondary: CustomColorsLight.onSecondary,
      secondaryContainer: CustomColorsLight.secondaryContainer,
      onSecondaryContainer: CustomColorsLight.onSecondaryContainer,
      tertiary: CustomColorsLight.tertiary,
      onTertiary: CustomColorsLight.onTertiary,
      tertiaryContainer: CustomColorsLight.tertiaryContainer,
      onTertiaryContainer: CustomColorsLight.onTertiaryContainer,
      error: CustomColorsLight.error,
      onError: CustomColorsLight.onError,
      errorContainer: CustomColorsLight.errorContainer,
      onErrorContainer: CustomColorsLight.onErrorContainer,
      background: CustomColorsLight.background,
      onBackground: CustomColorsLight.onBackground,
      surface: CustomColorsLight.surface,
      onSurface: CustomColorsLight.onSurface,
      surfaceVariant: CustomColorsLight.surfaceVariant,
      onSurfaceVariant: CustomColorsLight.onSurfaceVariant,
      outline: CustomColorsLight.outline,
      shadow: CustomColorsLight.shadow,
      inverseSurface: CustomColorsLight.inverseSurface,
      onInverseSurface: CustomColorsLight.onInverseSurface,
      inversePrimary: CustomColorsLight.inversePrimary,
    );
  }

  static ColorScheme get materialSchemeDark {
    return ColorScheme.dark(
      primary: CustomColorsDark.primary,
      onPrimary: CustomColorsDark.onPrimary,
      primaryContainer: CustomColorsDark.primaryContainer,
      onPrimaryContainer: CustomColorsDark.onPrimaryContainer,
      secondary: CustomColorsDark.secondary,
      onSecondary: CustomColorsDark.onSecondary,
      secondaryContainer: CustomColorsDark.secondaryContainer,
      onSecondaryContainer: CustomColorsDark.onSecondaryContainer,
      tertiary: CustomColorsDark.tertiary,
      onTertiary: CustomColorsDark.onTertiary,
      tertiaryContainer: CustomColorsDark.tertiaryContainer,
      onTertiaryContainer: CustomColorsDark.onTertiaryContainer,
      error: CustomColorsDark.error,
      onError: CustomColorsDark.onError,
      errorContainer: CustomColorsDark.errorContainer,
      onErrorContainer: CustomColorsDark.onErrorContainer,
      background: CustomColorsDark.background,
      onBackground: CustomColorsDark.onBackground,
      surface: CustomColorsDark.surface,
      onSurface: CustomColorsDark.onSurface,
      surfaceVariant: CustomColorsDark.surfaceVariant,
      onSurfaceVariant: CustomColorsDark.onSurfaceVariant,
      outline: CustomColorsDark.outline,
      shadow: CustomColorsDark.shadow,
      inverseSurface: CustomColorsDark.inverseSurface,
      onInverseSurface: CustomColorsDark.onInverseSurface,
      inversePrimary: CustomColorsDark.inversePrimary,
    );
  }

  static ThemeData get materialLight {
    return ThemeData.from(
      colorScheme: materialSchemeLight,
      useMaterial3: true,
    );
  }

  static ThemeData get materialDark {
    return ThemeData.from(
      colorScheme: materialSchemeDark,
      useMaterial3: true,
    );
  }
}
