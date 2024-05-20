import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_challenge/core/theme/colors.dart';
import 'package:ui_challenge/core/theme/map_theme.dart';
import 'package:ui_challenge/core/utils/config.dart';

enum ThemeOptions {
  light,
  dark,
  system,
}

class AppTheme {
  static Color get green => const Color(0xFF5AC71C);
  static var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static String mapTheme(ThemeOptions option) {
    return switch (option) {
      ThemeOptions.light => lightMapStyle,
      ThemeOptions.dark => darkMapStyle,
      ThemeOptions.system =>
        brightness == Brightness.light ? lightMapStyle : darkMapStyle
    };
  }

  static ThemeData lightTheme() => FlexThemeData.light(
        colorScheme: flexSchemeLight,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.sora().fontFamily,
        textTheme: Config.textTheme,
      );

  static ThemeData darkTheme() => FlexThemeData.dark(
        colorScheme: flexSchemeDark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.sora().fontFamily,
        textTheme: Config.textTheme,
      );

  static ThemeMode themeMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  static ThemeData themeOptions(ThemeOptions option) {
    return switch (option) {
      ThemeOptions.light => lightTheme(),
      ThemeOptions.dark => darkTheme(),
      ThemeOptions.system =>
        brightness == Brightness.light ? lightTheme() : darkTheme(),
    };
  }
}
