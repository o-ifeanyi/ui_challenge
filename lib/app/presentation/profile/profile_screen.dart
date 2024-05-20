import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge/core/theme/app_theme.dart';
import 'package:ui_challenge/core/utils/app_icons.dart';
import 'package:ui_challenge/core/utils/config.dart';

final themeNotifier = ValueNotifier(ThemeOptions.system);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(AppIcons.profile, size: 40)),
          Config.vBox16,
          ValueListenableBuilder(
            valueListenable: themeNotifier,
            builder: (context, theme, child) {
              return CupertinoSlidingSegmentedControl<ThemeOptions>(
                groupValue: theme,
                padding: Config.symmetric(h: 8, v: 8),
                children: {
                  ThemeOptions.light: Padding(
                    padding: Config.all(8),
                    child: const Text('Light'),
                  ),
                  ThemeOptions.dark: const Text('Dark'),
                  ThemeOptions.system: const Text('System'),
                },
                onValueChanged: (option) {
                  if (option != null) {
                    themeNotifier.value = option;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
