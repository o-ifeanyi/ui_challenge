import 'package:flutter/material.dart';
import 'package:ui_challenge/app/presentation/search/widgets/map_background.dart';
import 'package:ui_challenge/app/presentation/search/widgets/menu_button.dart';
import 'package:ui_challenge/core/utils/app_icons.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _animateScale = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Config.duration300);
      setState(() {
        _animateScale = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MapBackground(),
          SafeArea(
            minimum: Config.symmetric(h: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AnimatedScale(
                        duration: Config.duration300,
                        scale: _animateScale ? 1 : 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Config.radius32),
                          child: TextField(
                            style: context.textTheme.bodySmall
                                ?.copyWith(color: context.colorScheme.surface),
                            decoration: InputDecoration(
                              contentPadding: Config.fromLTRB(0, 15, 0, 0),
                              prefixIcon: Icon(
                                AppIcons.search,
                                color: context.colorScheme.surface,
                              ),
                              hintText: 'Search Pitsburg',
                              hintStyle: context.textTheme.bodySmall?.copyWith(
                                  color: context.colorScheme.surface),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              fillColor: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Config.hBox8,
                    AnimatedScale(
                      duration: Config.duration300,
                      scale: _animateScale ? 1 : 0,
                      child: CircleAvatar(
                        backgroundColor: context.colorScheme.onSurfaceVariant,
                        child: Icon(
                          AppIcons.filter,
                          size: 20,
                          color: context.colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        AnimatedScale(
                          duration: Config.duration300,
                          scale: _animateScale ? 1 : 0,
                          child: CircleAvatar(
                            backgroundColor:
                                context.colorScheme.outline.withOpacity(0.5),
                            child: Icon(
                              AppIcons.wallet,
                              size: 18,
                              color: context.textColor,
                            ),
                          ),
                        ),
                        Config.vBox4,
                        AnimatedScale(
                          duration: Config.duration300,
                          scale: _animateScale ? 1 : 0,
                          child: const MenuButton(),
                        ),
                      ],
                    ),
                    AnimatedScale(
                      duration: Config.duration300,
                      scale: _animateScale ? 1 : 0,
                      child: FilledButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.align,
                          size: 20,
                          color: context.textColor,
                        ),
                        label: Text(
                          'List of variants',
                          style: context.textTheme.bodySmall,
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              context.colorScheme.outline.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
                Config.vBox16,
                const SizedBox(height: kBottomNavigationBarHeight),
              ],
            ),
          )
        ],
      ),
    );
  }
}
