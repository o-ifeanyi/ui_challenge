import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_challenge/core/utils/app_icons.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class SliderButton extends StatefulWidget {
  const SliderButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.alignment = Alignment.centerLeft,
  });

  final String label;
  final VoidCallback onPressed;
  final AlignmentGeometry alignment;

  @override
  SliderButtonState createState() => SliderButtonState();
}

class SliderButtonState extends State<SliderButton> {
  bool _animateButton = false;
  bool _animateText = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final delay = Random().nextInt(500) + 2000;
      await Future.delayed(Duration(milliseconds: delay));
      setState(() {
        _animateButton = true;
      });
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        _animateText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Config.duration600,
      height: Config.h(40),
      width: _animateButton ? Config.width * 0.92 : Config.w(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Config.radius32),
        color: context.colorScheme.background.withOpacity(0.7),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Config.radius32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: <Widget>[
                  Container(
                    alignment: widget.alignment,
                    padding: Config.symmetric(h: 10),
                    child: AnimatedOpacity(
                      duration: Config.duration600,
                      opacity: _animateText ? 1 : 0,
                      child: Text(
                        widget.label,
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Config.duration600,
                    right: _animateButton
                        ? 0
                        : constraints.maxWidth - Config.w(40),
                    child: CircleAvatar(
                      radius: Config.h(20),
                      backgroundColor: context.colorScheme.background,
                      child: Icon(
                        AppIcons.arrowRight,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
