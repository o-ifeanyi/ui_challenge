import 'package:flutter/material.dart';
import 'package:ui_challenge/app/presentation/home/widgets/offer_item.dart';
import 'package:ui_challenge/core/theme/colors.dart';
import 'package:ui_challenge/core/utils/app_icons.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  bool _animateLocationSize = false;
  bool _animateLocationContent = false;
  bool _animateAvatar = false;
  bool _animateName = false;
  bool _animateLine1 = false;
  bool _animateLine2 = false;

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
      await Future.delayed(Config.duration300);
      setState(() {
        _animateLocationSize = true;
      });
      await Future.delayed(Config.duration300);
      setState(() {
        _animateAvatar = true;
        _animateLocationContent = true;
      });
      await Future.delayed(Config.duration300);
      setState(() {
        _animateName = true;
      });
      await Future.delayed(Config.duration300);
      setState(() {
        _animateLine1 = true;
      });
      await Future.delayed(Config.duration300);
      setState(() {
        _animateLine2 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Config.symmetric(h: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: Config.duration600,
                  width: _animateLocationSize ? Config.w(175) : 0,
                  child: Chip(
                    backgroundColor: context.colorScheme.onPrimary,
                    side: BorderSide.none,
                    label: AnimatedOpacity(
                      duration: Config.duration600,
                      opacity: _animateLocationContent ? 1 : 0,
                      child: Text(
                        'Saint Petersburg',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.secondary,
                        ),
                      ),
                    ),
                    avatar: AnimatedOpacity(
                      duration: Config.duration600,
                      opacity: _animateLocationContent ? 1 : 0,
                      child: Icon(
                        AppIcons.location,
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                AnimatedScale(
                  duration: Config.duration300,
                  scale: _animateAvatar ? 1 : 0,
                  child: Container(
                    height: Config.w(40),
                    width: Config.w(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/avatar.png'),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.1, 0.6],
                        colors: [
                          context.colorScheme.primaryContainer,
                          context.colorScheme.primary,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Config.vBox28,
          AnimatedOpacity(
            duration: Config.duration600,
            opacity: _animateName ? 1 : 0,
            child: Text(
              'Hi, Marina',
              style: context.textTheme.titleSmall?.copyWith(
                color: context.colorScheme.secondary,
              ),
            ),
          ),
          Config.vBox8,
          ClipRRect(
            child: Align(
              alignment: Alignment.bottomLeft,
              heightFactor: 1,
              child: AnimatedSlide(
                duration: Config.duration600,
                offset: _animateLine1 ? Offset.zero : const Offset(0, 1),
                child: Text(
                  'Let\'s select your',
                  style: context.textTheme.titleLarge,
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.bottomLeft,
              heightFactor: 1,
              child: AnimatedSlide(
                duration: Config.duration600,
                offset: _animateLine2 ? Offset.zero : const Offset(0, 1),
                child: Text(
                  'perfect place',
                  style: context.textTheme.titleLarge,
                ),
              ),
            ),
          ),
          Config.vBox28,
          Row(
            children: [
              const Expanded(
                child: OfferItem(
                  title: 'BUY',
                  count: 1034,
                  shape: BoxShape.circle,
                ),
              ),
              Config.hBox12,
              Expanded(
                child: OfferItem(
                  title: 'RENT',
                  count: 2212,
                  color: flexSchemeLight.surface,
                  textColor: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
