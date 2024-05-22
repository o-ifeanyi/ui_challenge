import 'package:flutter/material.dart';
import 'package:ui_challenge/core/theme/colors.dart';
import 'package:ui_challenge/core/utils/app_constants.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
    required this.activeIndex,
    required this.controller,
    required this.onPageChanged,
  });

  final int activeIndex;
  final PageController controller;
  final void Function(int index) onPageChanged;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  bool _animateNavBar = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Config.duration2000);
      setState(() {
        _animateNavBar = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: Config.duration300,
      offset: _animateNavBar ? Offset.zero : const Offset(0, 1),
      child: SafeArea(
        child: Material(
          shape: const StadiumBorder(),
          color: flexSchemeDark.surfaceContainer,
          child: Padding(
            padding: Config.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: AppConstants.navItems.map((item) {
                final selected = item.index == widget.activeIndex;
                return GestureDetector(
                  onTap: () async {
                    widget.controller.jumpToPage(item.index);
                    widget.onPageChanged.call(item.index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: item.index == 0 ? 0 : Config.w(8),
                    ),
                    child: CircleAvatar(
                      backgroundColor: selected
                          ? context.colorScheme.primary
                          : flexSchemeDark.shadow,
                      foregroundColor: flexSchemeLight.surface,
                      radius: selected ? Config.w(24) : Config.w(20),
                      child: Padding(
                        // filled search icon displaces for some reason
                        padding: EdgeInsets.only(
                          right: item.index == 0 ? 24 : 0,
                        ),
                        child: Icon(item.icon),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
