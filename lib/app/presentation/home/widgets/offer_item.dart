import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_challenge/core/theme/colors.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class OfferItem extends StatefulWidget {
  const OfferItem({
    super.key,
    required this.title,
    required this.count,
    this.shape,
    this.borderRadius,
    this.color,
    this.textColor,
  });

  final String title;
  final int count;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? textColor;

  @override
  State<OfferItem> createState() => _OfferItemState();
}

class _OfferItemState extends State<OfferItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;

  bool _animateSize = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Config.duration1500,
    );
    _animation = StepTween(
      begin: 0,
      end: widget.count,
    ).animate(_animationController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Config.duration1500);
      if (!mounted) return;
      setState(() {
        _animateSize = true;
      });
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: Config.duration300,
      scale: _animateSize ? 1 : 0,
      child: Container(
        height: Config.h(160),
        padding: Config.all(20),
        decoration: BoxDecoration(
          shape: widget.shape ?? BoxShape.rectangle,
          color: widget.color ?? context.colorScheme.primary,
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          children: [
            Text(
              widget.title,
              style: context.textTheme.bodyMedium?.copyWith(
                color: widget.textColor ?? flexSchemeLight.surface,
              ),
            ),
            Config.vBox20,
            AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Text(
                    '${_animation.value}',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.textColor ?? flexSchemeLight.surface,
                    ),
                  );
                }),
            Text(
              'offers',
              style: context.textTheme.bodySmall?.copyWith(
                color: widget.textColor ?? flexSchemeLight.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
