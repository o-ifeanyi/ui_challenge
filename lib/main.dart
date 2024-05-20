import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_challenge/app/presentation/index/index_screen.dart';
import 'package:ui_challenge/app/presentation/profile/profile_screen.dart';
import 'package:ui_challenge/core/theme/app_theme.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return ValueListenableBuilder(
            valueListenable: themeNotifier,
            builder: (context, theme, child) {
              return MaterialApp(
                title: 'UI Challenge',
                theme: AppTheme.themeOptions(theme),
                darkTheme: AppTheme.darkTheme(),
                themeMode: AppTheme.themeMode(context),
                builder: (BuildContext context, Widget? child) {
                  final scale = context.mediaQuery.textScaler.clamp(
                    minScaleFactor: 0.5,
                    maxScaleFactor: 1.0,
                  );
                  return MediaQuery(
                    data: context.mediaQuery.copyWith(
                      textScaler: scale,
                    ),
                    child: child!,
                  );
                },
                home: const IndexScreen(),
              );
            });
      },
    );
  }
}
